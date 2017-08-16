/*
 * Copyright (C) 2017 Alexander Nutz (nutz@informatik.uni-freiburg.de)
 * Copyright (C) 2017 University of Freiburg
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
package de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.transformula.vp.states;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.logic.Script;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.IIcfgSymbolTable;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.structure.IIcfgTransition;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.structure.IcfgLocation;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.variables.IProgramVar;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.variables.IProgramVarOrConst;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.transformula.vp.IEqNodeIdentifier;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.transformula.vp.VPDomainSymmetricPair;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.abstractinterpretationv2.domain.transformula.vp.elements.IEqFunctionIdentifier;
import de.uni_freiburg.informatik.ultimate.util.datastructures.relation.HashRelation;

/**
 *
 * @author Alexander Nutz (nutz@informatik.uni-freiburg.de)
 *
 * @param <ACTION>
 * @param <NODE>
 * @param <FUNCTION>
 */
public class EqBottomConstraint<ACTION extends IIcfgTransition<IcfgLocation>,
		NODE extends IEqNodeIdentifier<NODE, FUNCTION>,
		FUNCTION extends IEqFunctionIdentifier<NODE, FUNCTION>>
	extends EqConstraint<ACTION, NODE, FUNCTION> {

	public EqBottomConstraint(final EqConstraintFactory<ACTION, NODE, FUNCTION> factory) {
		super(factory);
	}

	@Override
	public boolean isBottom() {
		return true;
	}

	@Override
	public String toString() {
		return "Bottom";
	}

	@Override
	public Term getTerm(final Script script) {
		return script.term("false");
	}

	@Override
	public void freeze() {
		// TODO Auto-generated method stub
		super.freeze();
	}

	@Override
	public boolean isFrozen() {
		// TODO Auto-generated method stub
		return super.isFrozen();
	}

	////////////////////////////////////////////////////////////////////////
	/*
	 * from here on down: methods that probably don't need to be overwritten, but are, for performance, and to be safe..
	 */

	@Override
	public HashRelation<NODE, NODE> merge(final NODE node1, final NODE node2) {
		return new HashRelation<>();
	}

	@Override
	public void havoc(final NODE node) {
		// do nothing
	}

	@Override
	public void havocFunction(final FUNCTION func) {
		// do nothing
	}

	@Override
	public Set<NODE> getAllNodes() {
		return Collections.emptySet();
	}

	@Override
	public HashRelation<NODE, NODE> getSupportingElementEqualities() {
		return new HashRelation<>();
	}

	@Override
	public Set<VPDomainSymmetricPair<NODE>> getElementDisequalities() {
		return Collections.emptySet();
	}

	@Override
	public void addRawDisequality(final NODE first, final NODE second) {
		// do nothing
	}

//	@Override
//	public HashRelation<FUNCTION, FUNCTION> getSupportingFunctionEqualities() {
//		return new HashRelation<>();
//	}

	@Override
	public void addFunctionEqualityRaw(final FUNCTION func1, final FUNCTION func2) {
		// do nothing
	}

//	@Override
//	public Set<VPDomainSymmetricPair<FUNCTION>> getFunctionDisequalites() {
//		return Collections.emptySet();
//	}

	@Override
	public void addFunctionDisequality(final FUNCTION first, final FUNCTION second) {
		// do nothing
	}

	@Override
	public boolean checkForContradiction() {
		return true;
	}

	@Override
	public EqConstraint<ACTION, NODE, FUNCTION> projectExistentially(final Set<TermVariable> varsToProjectAway) {
		return this;
	}

	@Override
	public void renameVariables(final Map<Term, Term> substitutionMapping) {
		// do nothing
	}

	@Override
	public boolean areEqual(final NODE node1, final NODE node2) {
		return true;
	}

	@Override
	public HashRelation<FUNCTION, List<NODE>> getCCChild(final NODE representative1) {
		return new HashRelation<>();
	}

	@Override
	public boolean areUnequal(final NODE node1, final NODE node2) {
		return true;
	}

	@Override
	public Set<NODE> getDisequalities(final NODE node) {
		return Collections.emptySet();
	}

	@Override
	public boolean areEqual(final FUNCTION func1, final FUNCTION func2) {
		return true;
	}

	@Override
	public boolean areUnequal(final FUNCTION func1, final FUNCTION func2) {
		return true;
	}

	@Override
	public Set<IProgramVar> getVariables(final IIcfgSymbolTable symbolTable) {
		return Collections.emptySet();
	}

	@Override
	public Set<IProgramVarOrConst> getPvocs(final IIcfgSymbolTable symbolTable) {
		return Collections.emptySet();
	}

//	@Override
//	public Set<VPDomainSymmetricPair<NODE>> getAllElementEqualities() {
//		return Collections.emptySet();
//	}
//
//	@Override
//	public Set<VPDomainSymmetricPair<NODE>> getAllElementDisequalities() {
//		return Collections.emptySet();
//	}
//
//	@Override
//	public Set<VPDomainSymmetricPair<FUNCTION>> getAllFunctionEqualities() {
//		return Collections.emptySet();
//	}
//
//	@Override
//	public Set<VPDomainSymmetricPair<FUNCTION>> getAllFunctionDisequalities() {
//		return Collections.emptySet();
//	}

	@Override
	public boolean hasNode(final NODE node) {
		return false; // TODO ??
	}

//	@Override
//	public void addNodeRaw(final NODE nodeToAdd) {
//		// do nothing
//	}

	@Override
	public void removeNode(final NODE node) {
		// do nothing
	}

//	@Override
//	public void addFunctionRaw(final FUNCTION func) {
//		// do nothing
//	}

	@Override
	public Set<FUNCTION> getAllFunctions() {
		return Collections.emptySet();
	}

	@Override
	public void removeFunction(final FUNCTION func) {
		// do nothing
	}

//	@Override
//	boolean allNodesAndEqgnMapAreConsistent() {
//		return true;
//	}

	@Override
	public void addToAllNodes(final NODE node) {
		// do nothing
	}

	@Override
	public boolean isTop() {
		return false;
	}



}
