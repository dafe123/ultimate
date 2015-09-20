/*
 * Copyright (C) 2013-2015 Alexander Nutz (nutz@informatik.uni-freiburg.de)
 * Copyright (C) 2012-2015 Markus Lindenmann (lindenmm@informatik.uni-freiburg.de)
 * Copyright (C) 2013-2015 Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE CACSL2BoogieTranslator plug-in.
 * 
 * The ULTIMATE CACSL2BoogieTranslator plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE CACSL2BoogieTranslator plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE CACSL2BoogieTranslator plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE CACSL2BoogieTranslator plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE CACSL2BoogieTranslator plug-in grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.base.cHandler;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Stack;

import org.eclipse.cdt.core.dom.ast.IASTArraySubscriptExpression;
import org.eclipse.cdt.core.dom.ast.IASTBinaryExpression;

import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.LocationFactory;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.base.CHandler;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.container.c.CArray;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.container.c.CPointer;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.container.c.CPrimitive;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.container.c.CType;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.result.HeapLValue;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.result.LocalLValue;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.result.RValue;
import de.uni_freiburg.informatik.ultimate.cdt.translation.implementation.result.ExpressionResult;
import de.uni_freiburg.informatik.ultimate.cdt.translation.interfaces.Dispatcher;
import de.uni_freiburg.informatik.ultimate.core.preferences.UltimatePreferenceStore;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.ArrayLHS;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.AssertStatement;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.AssumeStatement;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.BinaryExpression;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.BinaryExpression.Operator;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.Expression;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.IntegerLiteral;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.LeftHandSide;
import de.uni_freiburg.informatik.ultimate.model.boogie.ast.Statement;
import de.uni_freiburg.informatik.ultimate.model.location.ILocation;
import de.uni_freiburg.informatik.ultimate.plugins.generator.cacsl2boogietranslator.Activator;
import de.uni_freiburg.informatik.ultimate.plugins.generator.cacsl2boogietranslator.preferences.CACSLPreferenceInitializer;
import de.uni_freiburg.informatik.ultimate.plugins.generator.cacsl2boogietranslator.preferences.CACSLPreferenceInitializer.POINTER_CHECKMODE;
import de.uni_freiburg.informatik.ultimate.result.Check;
import de.uni_freiburg.informatik.ultimate.result.Check.Spec;

/**
 * Class that handles translation of arrays.
 * 
 * @author Markus Lindenmann
 * @date 12.10.2012
 */
public class ArrayHandler {
	
	private POINTER_CHECKMODE m_checkArrayAccessOffHeap;

	public ArrayHandler() {
		UltimatePreferenceStore ups = new UltimatePreferenceStore(Activator.s_PLUGIN_ID);
		m_checkArrayAccessOffHeap = 
				ups.getEnum(CACSLPreferenceInitializer.LABEL_CHECK_ARRAYACCESSOFFHEAP, POINTER_CHECKMODE.class);
	}

	/**
	 * This stack stack collects ResultExpressions from subscripts. When going down
	 * into nested subscripts recursively a ResultExpression is pushed for each subscript.
	 * When going up again the ResultExpressions are popped/used.
	 */
	Stack<ExpressionResult> mCollectedSubscripts = new Stack<ExpressionResult>();
	
	
	public ExpressionResult handleArraySubscriptExpression(Dispatcher main,
			MemoryHandler memoryHandler, StructHandler structHandler,
			IASTArraySubscriptExpression node) {		
		ILocation loc = LocationFactory.createCLocation(node);
		
		ExpressionResult subscript = (ExpressionResult) main.dispatch(node.getArgument());
		ExpressionResult subscriptR = subscript.switchToRValueIfNecessary(main, memoryHandler, structHandler, loc);
		mCollectedSubscripts.push(subscriptR);
		
		//have we arrived at the innermost array subscript? (i.e. a[i] instead of a[j][i])
		boolean innerMostSubscript = 
				!(node.getArrayExpression() instanceof IASTArraySubscriptExpression);
		ExpressionResult innerResult = null;
		if (innerMostSubscript) {
			innerResult = ((ExpressionResult) main.dispatch(node.getArrayExpression()));
		} else {
			innerResult = handleArraySubscriptExpression(main, memoryHandler, 
					structHandler, (IASTArraySubscriptExpression) node.getArrayExpression());
		}
		
		ExpressionResult result = new ExpressionResult(innerResult);
		
		ExpressionResult currentSubscriptRex = mCollectedSubscripts.pop();
		result.stmt.addAll(currentSubscriptRex.stmt);
		result.decl.addAll(currentSubscriptRex.decl);
		result.auxVars.putAll(currentSubscriptRex.auxVars);
		result.overappr.addAll(currentSubscriptRex.overappr);
		
		if (result.lrVal.getCType() instanceof CPointer) {
			//we have a pointer that is accessed like an array
			result = result.switchToRValueIfNecessary(main, memoryHandler, structHandler, loc);
			CType pointedType = ((CPointer) result.lrVal.getCType()).pointsToType;
			RValue address = ((CHandler) main.cHandler).doPointerArithPointerAndInteger(
					main, IASTBinaryExpression.op_plus, loc, 
					(RValue) result.lrVal, 
					(RValue) currentSubscriptRex.lrVal,
					pointedType);
			result.lrVal  = new HeapLValue(address.getValue(), pointedType);
		} else {
			assert result.lrVal.getCType().getUnderlyingType() instanceof CArray : "cType not instanceof CArray";
			ArrayList<Expression> newDimensions = 
					new ArrayList<Expression>(Arrays.asList(((CArray) result.lrVal.getCType().getUnderlyingType())
							.getDimensions()));
			CType newCType = null;
			if (newDimensions.size() == 1) {
				newCType = ((CArray) result.lrVal.getCType().getUnderlyingType()).getValueType();
			} else {
				newDimensions.remove(0);
				newCType = new CArray(newDimensions.toArray(new Expression[0]), 
						((CArray) result.lrVal.getCType().getUnderlyingType()).getValueType()
						);
			}

			if (result.lrVal instanceof HeapLValue) {
				result.lrVal = new HeapLValue(((CHandler) main.cHandler).doPointerArith(
						main, IASTBinaryExpression.op_plus, loc, 
						((HeapLValue) result.lrVal).getAddress(),
						currentSubscriptRex.lrVal.getValue(),
						newCType), newCType);
			} else if (result.lrVal instanceof LocalLValue) {
				LocalLValue newLLVal = new LocalLValue((LocalLValue) result.lrVal);
				LeftHandSide innerArrayLHS = ((LocalLValue) result.lrVal).getLHS();
				if (innerArrayLHS instanceof ArrayLHS) {
					ArrayList<Expression> innerIndices = new ArrayList<Expression>(
							Arrays.asList(((ArrayLHS) innerArrayLHS).getIndices()));
					innerIndices.add(currentSubscriptRex.lrVal.getValue());
					newLLVal.lhs = new ArrayLHS(loc, 
							((ArrayLHS) innerArrayLHS).getArray(), innerIndices.toArray(new Expression[0]));
				} else {
					newLLVal.lhs = new ArrayLHS(loc, 
							innerArrayLHS, new Expression[] { currentSubscriptRex.lrVal.getValue() });	
				}
				Expression index = currentSubscriptRex.lrVal.getValue();
				CArray arrayType = (CArray) innerResult.lrVal.getCType();
				CType valueType = newCType;
				CPrimitive indexType = (CPrimitive) currentSubscriptRex.lrVal.getCType();
				addArrayBoundsCheck(main, memoryHandler, loc, index, indexType, arrayType, valueType, result);
				
				newLLVal.setCType(newCType);
				result.lrVal = newLLVal;
			} else {
				throw new AssertionError("should not happen");
			}
		}
		
		return result;
	}
	
	
	/**
	 * Add to exprResult a check that the index is within the bounds of an array.
	 * Depending on the preferences of this plugin we
	 * <ul> 
	 *  <li> assert that the index is in the range of the bounds,
	 *  <li> assume that the index is in the range of the bounds, or
	 *  <li> add nothing.
	 * </ul>
	 * @param index {@link Expression} that represents the index
	 * @param indexType C type of the index
	 * @param arrayType type of the array
	 * @param valueType type the the array's elements
	 */
	private void addArrayBoundsCheck(Dispatcher main, MemoryHandler memoryHandler, ILocation loc, 
			Expression index, CPrimitive indexType, 
			CArray arrayType, CType valueType, ExpressionResult exprResult) {
		if (m_checkArrayAccessOffHeap  == POINTER_CHECKMODE.IGNORE) {
			// do not check anything
			return;
		}
		CHandler cHandler = (CHandler) main.cHandler;
		final Expression inRange;
		// 2015-09-20 Matthias:
		// before we checked   (index <= length - sizeof(valueType))   this lead
		// to various problems with wrap-arounds and is unsound if we e.g., 
		// read chars from an int array now we check
		//     (index + sizeof(valueType)) <= length)
		// which is equivalent to
		//     (index + sizeof(valueType))-1 < length)
		// that has to be checked.
		{
			Expression indexPosition = cHandler.multiplyWithSizeOfAnotherType(loc, valueType, index, indexType);
			Expression zero = cHandler.getExpressionTranslation().constructLiteralForIntegerType(loc, indexType, BigInteger.ZERO);
			Expression nonNegative = cHandler.getExpressionTranslation().constructBinaryComparisonExpression(
					loc, IASTBinaryExpression.op_lessEqual, zero, indexType, 
					indexPosition, indexType);
			Expression firstInvalidPosition = memoryHandler.calculateSizeOf(arrayType, loc);
			// using the index type here is a hack and might lead to problems
			// with the bitvector translation
			Expression indexPositionPlusTypeSizeOfValue = cHandler.getExpressionTranslation().createArithmeticExpression(
					IASTBinaryExpression.op_plus, 
					indexPosition, indexType, 
					memoryHandler.calculateSizeOf(valueType, loc), indexType, loc);
			assert main.getTypeSizes().getSize(indexType.getType()) == 
					main.getTypeSizes().getSize(memoryHandler.getSize_T().getType()) : 
						"different typesizes, this will fail with bitvector translation";
			//TODO: 2015-09-20: Matthias this is not correct. We have to 
			// convert indexType and size_t to a common type that can take 
			// both values. 
			// I postponed to devise a solution, this a problem for the
			// bitvector translation bitlength of size_t is different from
			// bitlength of index
			Expression notTooBig = cHandler.getExpressionTranslation().constructBinaryComparisonExpression(
					loc, IASTBinaryExpression.op_lessEqual, indexPositionPlusTypeSizeOfValue, indexType, 
					firstInvalidPosition, indexType);
			inRange = new BinaryExpression(loc, Operator.LOGICAND, nonNegative, notTooBig);
		}
		switch (m_checkArrayAccessOffHeap) {
		case ASSERTandASSUME:
			Statement assertStm = new AssertStatement(loc, inRange);
			Check chk = new Check(Spec.ARRAY_INDEX);
			chk.addToNodeAnnot(assertStm);
			exprResult.stmt.add(assertStm);
			break;
		case ASSUME:
			Statement assumeStm = new AssumeStatement(loc, inRange);
			exprResult.stmt.add(assumeStm);
			break;
		case IGNORE:
			throw new AssertionError("case handled before");
		default:
			throw new AssertionError("unknown value");
		}
	}



}
