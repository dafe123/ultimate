/*
 * Copyright (C) 2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 Marius Greitschus (greitsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE AbstractInterpretationV2 plug-in.
 * 
 * The ULTIMATE AbstractInterpretationV2 plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE AbstractInterpretationV2 plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE AbstractInterpretationV2 plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE AbstractInterpretationV2 plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE AbstractInterpretationV2 plug-in grant you additional permission 
 * to convey the resulting work.
 */

package de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.sign;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;

import de.uni_freiburg.informatik.ultimate.boogie.IBoogieVar;
import de.uni_freiburg.informatik.ultimate.boogie.ast.BinaryExpression;
import de.uni_freiburg.informatik.ultimate.boogie.preprocessor.Activator;
import de.uni_freiburg.informatik.ultimate.core.services.model.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.evaluator.EvaluatorUtils.EvaluatorType;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.evaluator.IEvaluationResult;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.evaluator.IEvaluator;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.evaluator.INAryEvaluator;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.nonrelational.sign.SignDomainValue.Values;
import de.uni_freiburg.informatik.ultimate.plugins.generator.rcfgbuilder.cfg.CodeBlock;

/**
 * The binary expression evaluator of the sign domain.
 * 
 * @author Marius Greitschus (greitsch@informatik.uni-freiburg.de)
 *
 */
public class SignBinaryExpressionEvaluator implements INAryEvaluator<Values, SignDomainState, CodeBlock, IBoogieVar> {

	protected IEvaluator<Values, SignDomainState, CodeBlock, IBoogieVar> mLeftSubEvaluator;
	protected IEvaluator<Values, SignDomainState, CodeBlock, IBoogieVar> mRightSubEvaluator;
	protected BinaryExpression.Operator mOperator;
	protected final Set<String> mVariableSet;
	protected final Logger mLogger;
	protected final EvaluatorType mEvaluatorType;

	/**
	 * Creates an instance of the binary expression evaluator of the sign domain.
	 * 
	 * @param services
	 *            Ultimate service provider.
	 */
	public SignBinaryExpressionEvaluator(IUltimateServiceProvider services, EvaluatorType type) {
		mVariableSet = new HashSet<String>();
		mLogger = services.getLoggingService().getLogger(Activator.PLUGIN_ID);
		mEvaluatorType = type;
	}

	/**
	 * Sets the operator of the binary expression.
	 * 
	 * @param operator
	 *            The operator to be set. Must be of {@link BinaryExpression#Operator}.
	 */
	@Override
	public void setOperator(Object operator) {
		assert operator != null;
		assert operator instanceof BinaryExpression.Operator;
		mOperator = (BinaryExpression.Operator) operator;
	}

	@Override
	public List<IEvaluationResult<Values>> evaluate(SignDomainState currentState) {

		final List<IEvaluationResult<Values>> returnList = new ArrayList<>();

		for (String var : mLeftSubEvaluator.getVarIdentifiers()) {
			mVariableSet.add(var);
		}
		for (String var : mRightSubEvaluator.getVarIdentifiers()) {
			mVariableSet.add(var);
		}

		final List<IEvaluationResult<Values>> firstResult = mLeftSubEvaluator.evaluate(currentState);
		final List<IEvaluationResult<Values>> secondResult = mRightSubEvaluator.evaluate(currentState);

		for (final IEvaluationResult<Values> res1 : firstResult) {
			for (final IEvaluationResult<Values> res2 : secondResult) {
				switch (mOperator) {
				// case LOGICIFF:
				// break;
				// case LOGICIMPLIES:
				// break;
				// case LOGICAND:
				// break;
				// case LOGICOR:
				// break;
				// case COMPLT:
				// break;
				// case COMPGT:
				// break;
				// case COMPLEQ:
				// break;
				// case COMPGEQ:
				// break;
				// case COMPEQ:
				// break;
				// case COMPNEQ:
				// break;
				// case COMPPO:
				// break;
				// case BITVECCONCAT:
				// break;
				// case ARITHMUL:
				// break;
				// case ARITHDIV:
				// break;
				// case ARITHMOD:
				// break;
				case ARITHPLUS:
					returnList.add(performAddition(res1, res2));
					break;
				case ARITHMINUS:
					returnList.add(performSubtraction(res1, res2));
					break;
				default:
					throw new UnsupportedOperationException(
					        "The operator " + mOperator.toString() + " is not implemented.");
				}
			}
		}

		return returnList;
	}

	/**
	 * Adds two {@link SignDomainState}s. {@link SignDomainState}s can be (+), (-), (0), T, &perp;.<br />
	 * 
	 * Addition is done in the following way:<br />
	 * 
	 * <ol>
	 * <li>Same values:<br />
	 * <ul>
	 * <li>(+) + (+) = (+)</li>
	 * <li>(-) + (-) = (-)</li>
	 * <li>(0) + (0) = (0)</li>
	 * <li>T + T = T</li>
	 * <li>&perp; + &perp; = &perp;</li>
	 * </ul>
	 * </li>
	 * <li>Different values:<br />
	 * <ul>
	 * <li>(0) + (+) = (+)</li>
	 * <li>(0) + (-) = (-)</li>
	 * <li>(+) + (0) = (+)</li>
	 * <li>(-) + (0) = (-)</li>
	 * <li>(+) + (-) = T</li>
	 * <li>(-) + (+) = T</li>
	 * </ul>
	 * </li>
	 * <li>Special cases:<br />
	 * <ul>
	 * <li>&perp; + ... = &perp;</li>
	 * <li>... + &perp; = &perp;</li>
	 * <li>T + ... = T (if ... != &perp;)</li>
	 * <li>... + T = T (if ... != &perp;)</li>
	 * </ul>
	 * </li>
	 * </ol>
	 * 
	 * @param first
	 *            The first evaluation result to be added.
	 * @param second
	 *            The second evaluation result to be added.
	 * @return A new evaluation result corresponding to the result of the addition operation.
	 */
	private IEvaluationResult<Values> performAddition(IEvaluationResult<Values> first,
	        IEvaluationResult<Values> second) {

		assert first != null;
		assert second != null;

		// ===== Same values =====
		if (first.getValue().equals(second.getValue())) {
			return new SignDomainValue(first.getValue());
		}
		// ===== End Same values =====

		// ===== Special cases =====
		// If first = \bot or second = \bot, return \bot.
		if (first.getValue().equals(Values.BOTTOM) || second.getValue().equals(Values.BOTTOM)) {
			return new SignDomainValue(Values.BOTTOM);
		}

		// If one of them is \top, return \top.
		if (first.getValue().equals(Values.TOP) || second.getValue().equals(Values.TOP)) {
			return new SignDomainValue(Values.TOP);
		}
		// ===== End Special cases =====

		// ===== Different values =====
		// If one of the values is 0, return the other value.
		if (first.getValue().equals(Values.ZERO)) {
			return new SignDomainValue(second.getValue());
		}
		if (second.getValue().equals(Values.ZERO)) {
			return new SignDomainValue(first.getValue());
		}

		// If both values are different, return \top.
		if (!first.getValue().equals(second.getValue())) {
			return new SignDomainValue(Values.TOP);
		}
		// ===== End Different values =====

		// We should have covered all cases. If not, throw exception.
		throw new UnsupportedOperationException(
		        "There is one case which has not been covered in the addition of SignedDomain values. first: "
		                + first.getValue().toString() + ", second: " + second.getValue().toString());
	}

	/**
	 * Subtracts two {@link SignDomainState}s. {@link SignDomainState}s can be (+), (-), (0), T, &perp;.<br />
	 * 
	 * Addition is done in the following way:<br />
	 * 
	 * <ol>
	 * <li>Same values:<br />
	 * <ul>
	 * <li>(+) - (+) = T</li>
	 * <li>(-) - (-) = T</li>
	 * <li>(0) - (0) = (0)</li>
	 * <li>T - T = T</li>
	 * <li>&perp; - &perp; = &perp;</li>
	 * </ul>
	 * </li>
	 * <li>Different values:<br />
	 * <ul>
	 * <li>(0) - (+) = (-)</li>
	 * <li>(0) - (-) = (+)</li>
	 * <li>(+) - (0) = (+)</li>
	 * <li>(-) - (0) = (-)</li>
	 * <li>(+) - (-) = (+)</li>
	 * <li>(-) - (+) = (-)</li>
	 * </ul>
	 * </li>
	 * <li>Special cases:<br />
	 * <ul>
	 * <li>&perp; - ... = &perp;</li>
	 * <li>... - &perp; = &perp;</li>
	 * <li>T - ... = T (if ... != &perp;)</li>
	 * <li>... - T = T (if ... != &perp;)</li>
	 * </ul>
	 * </li>
	 * </ol>
	 * 
	 * @param first
	 *            The first evaluation result to be subtracted.
	 * @param second
	 *            The second evaluation result to be subtracted.
	 * @return A new evaluation result corresponding to the result of the subtract operation.
	 */
	private IEvaluationResult<Values> performSubtraction(IEvaluationResult<Values> first,
	        IEvaluationResult<Values> second) {

		assert first != null;
		assert second != null;

		// ====== Same Values ======
		if (first.getValue().equals(Values.ZERO) && second.getValue().equals(Values.ZERO)) {
			return new SignDomainValue(Values.ZERO);
		}
		if (first.getValue().equals(Values.BOTTOM) || second.getValue().equals(Values.BOTTOM)) {
			return new SignDomainValue(Values.BOTTOM);
		}
		if (first.getValue().equals(second.getValue())) {
			return new SignDomainValue(Values.TOP);
		}
		// ====== End Same Values ======

		// ====== Different Values ======
		if (first.getValue().equals(Values.ZERO)) {
			return negateValue(first.getValue());
		}
		if (second.getValue().equals(Values.ZERO)) {
			return new SignDomainValue(first.getValue());
		}
		if (first.getValue().equals(Values.POSITIVE) && second.getValue().equals(Values.NEGATIVE)) {
			return new SignDomainValue(Values.POSITIVE);
		}
		if (first.getValue().equals(Values.NEGATIVE) && second.getValue().equals(Values.POSITIVE)) {
			return new SignDomainValue(Values.NEGATIVE);
		}
		// ====== End Different Values ======

		// We should have covered all cases. If not, throw exception.
		throw new UnsupportedOperationException(
		        "There is one case which has not been covered in the subtraction of SignedDomain values. first: "
		                + first.getValue().toString() + ", second: " + second.getValue().toString());
	}

	/**
	 * Adds a subevaluator to {@link this} if possible.
	 */
	@Override
	public void addSubEvaluator(IEvaluator<Values, SignDomainState, CodeBlock, IBoogieVar> evaluator) {
		if (mLeftSubEvaluator != null && mRightSubEvaluator != null) {
			throw new UnsupportedOperationException("There are no free sub evaluators left to be assigned.");
		}

		if (mLeftSubEvaluator == null) {
			mLeftSubEvaluator = evaluator;
			return;
		}

		mRightSubEvaluator = evaluator;
	}

	/**
	 * Returns true if {@link this} still has subevaluators that are not empty.
	 */
	@Override
	public boolean hasFreeOperands() {
		return (mLeftSubEvaluator == null || mRightSubEvaluator == null);
	}

	/**
	 * Negates the given value.
	 * 
	 * @param value
	 *            The value to negate.
	 * @return The negated value as new object.
	 */
	private SignDomainValue negateValue(Values value) {
		assert value != null;

		switch (value) {
		case POSITIVE:
			return new SignDomainValue(Values.NEGATIVE);
		case NEGATIVE:
			return new SignDomainValue(Values.POSITIVE);
		case TOP:
			return new SignDomainValue(Values.TOP);
		case BOTTOM:
			return new SignDomainValue(Values.BOTTOM);
		case ZERO:
			return new SignDomainValue(Values.ZERO);
		default:
			throw new UnsupportedOperationException(
			        "The sign domain value " + value.toString() + " is not implemented.");
		}
	}

	@Override
	public Set<String> getVarIdentifiers() {
		return mVariableSet;
	}

	@Override
	public int getArity() {
		return 2;
	}

	@Override
	public boolean containsBool() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<SignDomainState> inverseEvaluate(final IEvaluationResult<Values> computedValue,
	        final SignDomainState currentState) {
		// TODO Auto-generated method stub
		return null;
	}
}
