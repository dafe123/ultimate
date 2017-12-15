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
package de.uni_freiburg.informatik.ultimate.modelcheckerutils.absint.vpdomain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import de.uni_freiburg.informatik.ultimate.logic.QuantifiedFormula;
import de.uni_freiburg.informatik.ultimate.logic.QuotedObject;
import de.uni_freiburg.informatik.ultimate.logic.Script;
import de.uni_freiburg.informatik.ultimate.logic.Script.LBool;
import de.uni_freiburg.informatik.ultimate.logic.Sort;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.SmtUtils;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.Substitution;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.arrays.MultiDimensionalSort;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.managedscript.ManagedScript;
import de.uni_freiburg.informatik.ultimate.util.datastructures.BidirectionalMap;
import de.uni_freiburg.informatik.ultimate.util.datastructures.DataStructureUtils;
import de.uni_freiburg.informatik.ultimate.util.datastructures.congruenceclosure.CcManager;
import de.uni_freiburg.informatik.ultimate.util.datastructures.congruenceclosure.CongruenceClosure;
import de.uni_freiburg.informatik.ultimate.util.datastructures.congruenceclosure.IRemovalInfo;
import de.uni_freiburg.informatik.ultimate.util.datastructures.poset.IPartialComparator;
import de.uni_freiburg.informatik.ultimate.util.datastructures.poset.PartialOrderCache;
import de.uni_freiburg.informatik.ultimate.util.datastructures.relation.NestedMap2;
import de.uni_freiburg.informatik.ultimate.util.datastructures.relation.Triple;

public class WeqCcManager<NODE extends IEqNodeIdentifier<NODE>> {

	private final CcManager<NODE> mCcManager;
	private final ManagedScript mMgdScript;
	private final ILogger mLogger;

	private final WeqCongruenceClosure<NODE> mTautologicalWeqCc;
	private final WeqCongruenceClosure<NODE> mInconsistentWeqCc;

	private final NestedMap2<Sort, Integer, NODE> mDimensionToWeqVariableNode;
	private final BidirectionalMap<Term, Term> mWeqVarsToWeqPrimedVars;

	private final AbstractNodeAndFunctionFactory<NODE, Term> mNodeAndFunctionFactory;
	private final boolean mDebug = true;

	public WeqCcManager(final ILogger logger, final IPartialComparator<CongruenceClosure<NODE>> ccComparator,
			final ManagedScript mgdScript, final AbstractNodeAndFunctionFactory<NODE, Term> nodeAndFunctionFactory) {
		mCcManager = new CcManager<>(logger, ccComparator);
		mMgdScript = mgdScript;
		mLogger = logger;

		mTautologicalWeqCc = new WeqCongruenceClosure<>(this);
		mTautologicalWeqCc.freeze();

		mInconsistentWeqCc = new WeqCongruenceClosure<>(true);

		mDimensionToWeqVariableNode = new NestedMap2<>();
		mWeqVarsToWeqPrimedVars = new BidirectionalMap<>();

		mNodeAndFunctionFactory = nodeAndFunctionFactory;
	}

	public WeqCongruenceClosure<NODE> getTautologicalWeqCc(final boolean modifiable) {
		if (modifiable) {
			return new WeqCongruenceClosure<>(this);
		} else {
			return mTautologicalWeqCc;
		}
	}

	public WeqCongruenceClosure<NODE> getInconsistentWeqCc() {
		return mInconsistentWeqCc;
	}

	WeqCongruenceClosure<NODE> getWeqMeet(final WeqCongruenceClosure<NODE> weqcc, final CongruenceClosure<NODE> cc,
			final IRemovalInfo<NODE> remInfo, final boolean inplace) {

		final WeqCongruenceClosure<NODE> result;
		if (remInfo == null) {
			result = weqcc.meetRec(cc, inplace);
		} else {
			assert false : "do we need this case?";
			result = null;
		}
		return result;
	}

	public WeqCongruenceClosure<NODE> getWeqMeet(final WeqCongruenceClosure<NODE> weqcc,
			final CongruenceClosure<NODE> cc, final boolean inplace) {
		return getWeqMeet(weqcc, cc, null, inplace);
	}

	public WeqCongruenceClosure<NODE> addNode(final NODE node, final WeqCongruenceClosure<NODE> origWeqCc,
			final boolean inplace) {
		if (origWeqCc.hasElement(node)) {
			// node is already present --> nothing to do
			return origWeqCc;
		}

		if (inplace) {
			origWeqCc.addElement(node);
			return origWeqCc;
		} else {
			final WeqCongruenceClosure<NODE> unfrozen = unfreeze(origWeqCc);
			unfrozen.addElement(node);
			unfrozen.freeze();
			return unfrozen;
		}
	}

	WeqCongruenceClosure<NODE> unfreeze(final WeqCongruenceClosure<NODE> origWeqCc) {
		assert origWeqCc.isFrozen();
		final WeqCongruenceClosure<NODE> result = new WeqCongruenceClosure<>(origWeqCc);
		assert !result.isFrozen();
		assert result.sanityCheck();
		assert !result.getCongruenceClosure().isFrozen();
		assert result.getWeakEquivalenceGraph().assertLabelsAreUnfrozen();
		return result;
	}

	public WeakEquivalenceEdgeLabel<NODE> filterRedundantCcs(final WeakEquivalenceEdgeLabel<NODE> label) {
		final Set<CongruenceClosure<NODE>> filtered = mCcManager.filterRedundantCcs(label.getDisjuncts());
		return new WeakEquivalenceEdgeLabel<>(label.getWeqGraph(), filtered);
	}

	public Set<CongruenceClosure<NODE>> filterRedundantCcs(final Set<CongruenceClosure<NODE>> ccs) {
		return mCcManager.filterRedundantCcs(ccs);
	}

	public IPartialComparator<CongruenceClosure<NODE>> getCcComparator() {
		return mCcManager.getCcComparator();
	}

	public Set<CongruenceClosure<NODE>> filterRedundantCcs(final Set<CongruenceClosure<NODE>> ccs,
			final PartialOrderCache<CongruenceClosure<NODE>> ccPoCache) {
		return mCcManager.filterRedundantCcs(ccs, ccPoCache);
	}

	public WeqCongruenceClosure<NODE> reportEquality(final WeqCongruenceClosure<NODE> origWeqCc, final NODE node1,
			final NODE node2, final boolean inplace) {
		if (inplace) {
			origWeqCc.reportEquality(node1, node2);
			return origWeqCc;
		} else {
			final WeqCongruenceClosure<NODE> unfrozen = unfreeze(origWeqCc);
			unfrozen.reportEquality(node1, node2);
			unfrozen.freeze();
			assert checkReportEqualityResult(origWeqCc, node1, node2, unfrozen);
			return unfrozen;
		}
	}

	public CongruenceClosure<NODE> reportEquality(final CongruenceClosure<NODE> origCc, final NODE node1,
			final NODE node2, final boolean inplace) {
		final CongruenceClosure<NODE> result = mCcManager.reportEquality(node1, node2, origCc, inplace);
		assert checkReportEqualityResult(origCc, node1, node2, result);
		return result;
	}

	public WeqCongruenceClosure<NODE> reportDisequality(final WeqCongruenceClosure<NODE> origWeqCc, final NODE node1,
			final NODE node2) {
		if (WeqSettings.REPORT_EQ_DEQ_INPLACE) {
			origWeqCc.reportDisequality(node1, node2);
			return origWeqCc;
		} else {
			final WeqCongruenceClosure<NODE> unfrozen = unfreeze(origWeqCc);
			unfrozen.reportDisequality(node1, node2);
			unfrozen.freeze();
			assert checkReportDisequalityResult(origWeqCc, node1, node2, unfrozen);
			return unfrozen;
		}
	}

	public WeqCongruenceClosure<NODE> reportWeakEquivalence(final WeqCongruenceClosure<NODE> origWeqCc,
			final NODE array1, final NODE array2, final NODE storeIndex, final boolean inplace) {
		if (inplace) {
			origWeqCc.reportWeakEquivalence(array1, array2, storeIndex);
			return origWeqCc;
		} else {
			final WeqCongruenceClosure<NODE> unfrozen = unfreeze(origWeqCc);
			unfrozen.reportWeakEquivalence(array1, array2, storeIndex);
			unfrozen.freeze();
			assert checkReportWeakEquivalenceResult(origWeqCc, array1, array2, storeIndex, unfrozen);
			return unfrozen;
		}
	}

	public WeqCongruenceClosure<NODE> projectAway(final WeqCongruenceClosure<NODE> origWeqCc, final NODE node) {
		// TODO: unsure about this freezing -- is there a more efficient solution?
		freezeIfNecessary(origWeqCc);

		final WeqCongruenceClosure<NODE> unfrozen = unfreeze(origWeqCc);
		RemoveWeqCcElement.removeSimpleElement(unfrozen, node);
		unfrozen.freeze();
		assert checkProjectAwayResult(origWeqCc, node, unfrozen);
		return unfrozen;
	}

	public WeqCongruenceClosure<NODE> makeCopyForWeqMeet(final WeqCongruenceClosure<NODE> originalPa) {
		final WeqCongruenceClosure<NODE> result = new WeqCongruenceClosure<>(originalPa, true);
		if (!WeqSettings.REPORT_EQ_DEQ_INPLACE) {
			result.freeze();
		}
		return result;
	}

	/**
	 * Could also be called "makeSnapshot"
	 * Used when we want to use a WeqCc but also want to remember its original state.
	 * This is called when we need a copy in any case (roughly..)
	 * If we are doing things inplace, we may need a copy from time to time, that is the purpose of this method.
	 * If the manager freezes everything before returning it, and the original is frozen, we don't need to make a copy
	 * here.
	 * TODO: not entirely clear.. think through..
	 * @param original
	 * @return
	 */
	public WeqCongruenceClosure<NODE> getFrozenCopy(final WeqCongruenceClosure<NODE> original) {
		if (WeqSettings.FREEZE_ALL_IN_MANAGER && original.isFrozen()) {
			// original is frozen --> a copy should not be necessary (use unfreeze if an
			// unfrozen copy is needed)
			return original;
		}
		final WeqCongruenceClosure<NODE> copy = new WeqCongruenceClosure<>(original, false);
		if (WeqSettings.FREEZE_ALL_IN_MANAGER) {
			copy.freeze();
		}
		return copy;
	}

	public WeqCongruenceClosure<NODE> meet(final WeqCongruenceClosure<NODE> weqcc1,
			final WeqCongruenceClosure<NODE> weqcc2, final boolean inplace) {
		if (inplace) {
			WeqCongruenceClosure<NODE> weqcc1_old = null;
			if (mDebug) {
				weqcc1_old = getFrozenCopy(weqcc1);
			}
			weqcc1.meet(weqcc2, true);
			if (mDebug) {
				assert checkMeetResult(weqcc1_old, weqcc2, weqcc1);
			}
			return weqcc1;
		} else {
			if (WeqSettings.FREEZE_ALL_IN_MANAGER) {
				assert weqcc1.isFrozen();
				assert weqcc2.isFrozen();
			} else {
				assert !weqcc1.isFrozen();
				assert !weqcc2.isFrozen();
			}

			final WeqCongruenceClosure<NODE> result = weqcc1.meet(weqcc2, true);
			result.freeze();

			assert checkMeetResult(weqcc1, weqcc2, result);
			return result;
		}
	}


	public CongruenceClosure<NODE> meet(final CongruenceClosure<NODE> cc1, final CongruenceClosure<NODE> cc2,
			final boolean inplace) {
		return meet(cc1, cc2, null, inplace);
	}

	public CongruenceClosure<NODE> meet(final CongruenceClosure<NODE> cc1, final CongruenceClosure<NODE> cc2,
			final IRemovalInfo<NODE> elementCurrentlyBeingRemoved, final boolean inplace) {
		// (just passing it through to CcManager)
		CongruenceClosure<NODE> cc1_old = null;
		if (mDebug && inplace) {
			cc1_old = mCcManager.copyNoRemInfo(cc1);
		} else if (mDebug && !inplace) {
			cc1_old = cc1;
		}

		final CongruenceClosure<NODE> result = mCcManager.meet(cc1, cc2, elementCurrentlyBeingRemoved, inplace);

		if (mDebug) {
				assert checkMeetResult(cc1_old, cc2, result);
		}

		return result;
	}

	public CongruenceClosure<NODE> join(final CongruenceClosure<NODE> cc1, final CongruenceClosure<NODE> cc2,
			final boolean modifiable) {
		// (just passing it through to CcManager)
		final CongruenceClosure<NODE> result = mCcManager.join(cc1, cc2, modifiable);
		assert checkJoinResult(cc1, cc2, result);
		return result;
	}

	public WeqCongruenceClosure<NODE> join(final WeqCongruenceClosure<NODE> weqcc1,
			final WeqCongruenceClosure<NODE> weqcc2) {
		freezeIfNecessary(weqcc1);
		freezeIfNecessary(weqcc2);

		if (weqcc1.isInconsistent()) {
			return weqcc2;
		}
		if (weqcc2.isInconsistent()) {
			return weqcc1;
		}
		if (weqcc1.isTautological() || weqcc2.isTautological()) {
			return getTautologicalWeqCc(true);
		}

		final WeqCongruenceClosure<NODE> result = weqcc1.join(weqcc2);
		result.freeze();
		assert checkJoinResult(weqcc1, weqcc2, result);
		return result;
	}

	private void freezeIfNecessary(final WeqCongruenceClosure<NODE> weqcc) {
		if (!weqcc.isFrozen()) {
			weqcc.freeze();
		}
	}

	public CongruenceClosure<NODE> renameVariablesCc(final CongruenceClosure<NODE> weqCc,
			final Map<Term, Term> substitutionMapping) {
		return mCcManager.transformElements(weqCc, e -> e.renameVariables(substitutionMapping));
	}

	public WeqCongruenceClosure<NODE> renameVariables(final WeqCongruenceClosure<NODE> weqCc,
			final Map<Term, Term> substitutionMapping) {
		final WeqCongruenceClosure<NODE> unfrozen = unfreeze(weqCc);
		unfrozen.transformElementsAndFunctions(e -> e.renameVariables(substitutionMapping));
		unfrozen.freeze();
		// TODO: implement a result check here?
		return unfrozen;
	}

	public boolean isStrongerThan(final WeqCongruenceClosure<NODE> weqcc1, final WeqCongruenceClosure<NODE> weqcc2) {
		return weqcc1.isStrongerThan(weqcc2);
	}

	public WeakEquivalenceEdgeLabel<NODE> getSingletonEdgeLabel(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph,
			final CongruenceClosure<NODE> newConstraint) {
		return new WeakEquivalenceEdgeLabel<>(weakEquivalenceGraph, Collections.singleton(newConstraint));
	}

	public WeakEquivalenceEdgeLabel<NODE> getSingletonEdgeLabel(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph,
			final Set<CongruenceClosure<NODE>> constraints) {
		return new WeakEquivalenceEdgeLabel<>(weakEquivalenceGraph, constraints);
	}

	public CongruenceClosure<NODE> addNode(final NODE storeIndex, final CongruenceClosure<NODE> congruenceClosure,
			final boolean inplace, final boolean omitSanityChecks) {
		return mCcManager.addElement(congruenceClosure, storeIndex, inplace, omitSanityChecks);
	}

	public static <NODE extends IEqNodeIdentifier<NODE>> Term weqCcToTerm(final Script script,
			final WeqCongruenceClosure<NODE> weqCc) {
		if (weqCc.isInconsistent()) {
			return script.term("false");
		}

		final List<Term> allConjuncts = new ArrayList<>();
		// allConjuncts.addAll(EqConstraint.partialArrangementToCube(script, this));
		allConjuncts.addAll(CongruenceClosureSmtUtils.congruenceClosureToCube(script, weqCc.getCongruenceClosure()));

		final List<Term> weakEqConstraints = weqCc.getWeakEquivalenceGraph()
				.getWeakEquivalenceConstraintsAsTerms(script);
		allConjuncts.addAll(weakEqConstraints);

		final Term result = SmtUtils.and(script, allConjuncts.toArray(new Term[allConjuncts.size()]));
		return result;
	}

	public List<NODE> getAllWeqVarsNodeForFunction(final NODE func) {
		if (!func.getSort().isArraySort()) {
			return Collections.emptyList();
		}
		final MultiDimensionalSort mdSort = new MultiDimensionalSort(func.getSort());
		final List<Sort> indexSorts = mdSort.getIndexSorts();
		final List<NODE> result = new ArrayList<>(mdSort.getDimension());
		for (int i = 0; i < mdSort.getDimension(); i++) {
			result.add(this.getWeqVariableNodeForDimension(i, indexSorts.get(i)));
		}
		return result;
	}

	public Map<Term, Term> getWeqPrimedVarsToWeqVars() {
		return mWeqVarsToWeqPrimedVars.inverse();
	}

	public Map<Term, Term> getWeqVarsToWeqPrimedVars() {
		return mWeqVarsToWeqPrimedVars;
	}

	public Set<NODE> getAllWeqPrimedAndUnprimedNodes() {
		return DataStructureUtils.union(getAllWeqNodes(), getAllWeqPrimedNodes());
	}

	public Set<NODE> getAllWeqPrimedNodes() {
		final Set<NODE> result = new HashSet<>();
		for (final Triple<Sort, Integer, NODE> en : mDimensionToWeqVariableNode.entrySet()) {
			result.add(mNodeAndFunctionFactory.getExistingNode(mWeqVarsToWeqPrimedVars.get(en.getThird().getTerm())));
		}
		return result;
	}

	public NODE getWeqVariableNodeForDimension(final int dimensionNumber, final Sort sort) {
		NODE result = mDimensionToWeqVariableNode.get(sort, dimensionNumber);
		if (result == null) {
			final TermVariable weqVar = mMgdScript.constructFreshTermVariable("weq" + dimensionNumber, sort);
			final TermVariable weqPrimedVar = mMgdScript.constructFreshTermVariable("weqPrime" + dimensionNumber, sort);
			mWeqVarsToWeqPrimedVars.put(weqVar, weqPrimedVar);
			result = getEqNodeAndFunctionFactory().getOrConstructNode(weqVar);
			mDimensionToWeqVariableNode.put(sort, dimensionNumber, result);
		}
		return result;
	}

	public TermVariable getWeqVariableForDimension(final int dimensionNumber, final Sort sort) {
		return (TermVariable) getWeqVariableNodeForDimension(dimensionNumber, sort).getTerm();
	}

	public Set<TermVariable> getAllWeqVariables() {
		final Set<TermVariable> result = new HashSet<>();
		mDimensionToWeqVariableNode.entrySet().forEach(en -> result.add((TermVariable) en.getThird().getTerm()));
		return result;
	}

	public Set<NODE> getAllWeqNodes() {
		final Set<NODE> result = new HashSet<>();
		for (final Triple<Sort, Integer, NODE> en : mDimensionToWeqVariableNode.entrySet()) {
			result.add(en.getThird());
		}
		return result;
	}

	public ILogger getLogger() {
		return mLogger;
	}

	public AbstractNodeAndFunctionFactory<NODE, Term> getEqNodeAndFunctionFactory() {
		return mNodeAndFunctionFactory;
	}

	private boolean checkReportWeakEquivalenceResult(final WeqCongruenceClosure<NODE> origWeqCc, final NODE array1,
			final NODE array2, final NODE storeIndex, final WeqCongruenceClosure<NODE> unfrozen) {
		// TODO Auto-generated method stub
		return true;
	}

	private boolean checkReportEqualityResult(final CongruenceClosure<NODE> origCc, final NODE node1, final NODE node2,
			final CongruenceClosure<NODE> result) {
		return checkReportEqualityResult(
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), origCc), node1.getTerm(),
				node2.getTerm(), CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkReportEqualityResult(final WeqCongruenceClosure<NODE> origCc, final NODE node1,
			final NODE node2, final WeqCongruenceClosure<NODE> result) {
		return checkReportEqualityResult(weqCcToTerm(mMgdScript.getScript(), origCc), node1.getTerm(), node2.getTerm(),
				weqCcToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkReportEqualityResult(final Term original, final Term node1, final Term node2,
			final Term result) {
		// check that "origCc && node1 = node2 <-> result"
		mMgdScript.lock(this);
		final Script script = mMgdScript.getScript();

		final Term originalAndEquality = SmtUtils.and(script, original, mMgdScript.term(this, "=", node1, node2));

		final boolean res = checkImplicationHolds(script, originalAndEquality, result)
				&& checkImplicationHolds(script, result, originalAndEquality);
		mMgdScript.unlock(this);
		return res;
	}

	private boolean checkReportDisequalityResult(final CongruenceClosure<NODE> origCc, final NODE node1,
			final NODE node2, final CongruenceClosure<NODE> result) {
		return checkReportDisequalityResult(
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), origCc), node1.getTerm(),
				node2.getTerm(), CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkReportDisequalityResult(final WeqCongruenceClosure<NODE> origCc, final NODE node1,
			final NODE node2, final WeqCongruenceClosure<NODE> result) {
		return checkReportDisequalityResult(weqCcToTerm(mMgdScript.getScript(), origCc), node1.getTerm(),
				node2.getTerm(), weqCcToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkReportDisequalityResult(final Term original, final Term node1, final Term node2,
			final Term result) {
		// check that "origCc && node1 != node2 <-> result"
		mMgdScript.lock(this);
		final Script script = mMgdScript.getScript();

		final Term originalAndEquality = SmtUtils.and(script, original,
				mMgdScript.term(this, "distinct", node1, node2));

		final boolean res = checkImplicationHolds(script, originalAndEquality, result)
				&& checkImplicationHolds(script, result, originalAndEquality);
		mMgdScript.unlock(this);
		return res;
	}

	private boolean checkProjectAwayResult(final WeqCongruenceClosure<NODE> original, final NODE nodeToProjectAway,
			final WeqCongruenceClosure<NODE> result) {
		return checkProjectAwayResult(weqCcToTerm(mMgdScript.getScript(), original), nodeToProjectAway.getTerm(),
				weqCcToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkProjectAwayResult(final Term original, final Term projectedVar, final Term result) {
		// check that "(exists projectedVar. original) -> result"
		mMgdScript.lock(this);
		final Script script = mMgdScript.getScript();

		final Term originalProjected;
		if (projectedVar instanceof TermVariable) {
			originalProjected = SmtUtils.quantifier(script, QuantifiedFormula.EXISTS,
					Collections.singleton((TermVariable) projectedVar), original);
		} else {
			throw new AssertionError("this actually occurs?.. just omit quantification then?");
		}

		final boolean res = checkImplicationHolds(script, originalProjected, result);
		mMgdScript.unlock(this);
		return res;
	}

	private boolean checkMeetResult(final CongruenceClosure<NODE> cc1, final CongruenceClosure<NODE> cc2,
			final CongruenceClosure<NODE> result) {
		return checkMeetResult(CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), cc1),
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), cc2),
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkMeetResult(final WeqCongruenceClosure<NODE> weqcc1, final WeqCongruenceClosure<NODE> weqcc2,
			final WeqCongruenceClosure<NODE> result) {
		return checkMeetResult(weqCcToTerm(mMgdScript.getScript(), weqcc1), weqCcToTerm(mMgdScript.getScript(), weqcc2),
				weqCcToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkMeetResult(final Term cc1, final Term cc2, final Term resultTerm) {
		// check that "cc1 /\ cc2 <-> result" (our meet is precise, right?)
		mMgdScript.lock(this);
		final Script script = mMgdScript.getScript();
		final Term cc1AndCc2Term = SmtUtils.and(script, cc1, cc2);
		final boolean res = checkImplicationHolds(script, cc1AndCc2Term, resultTerm)
				&& checkImplicationHolds(script, resultTerm, cc1AndCc2Term);
		mMgdScript.unlock(this);
		return res;
	}

	private boolean checkJoinResult(final CongruenceClosure<NODE> cc1, final CongruenceClosure<NODE> cc2,
			final CongruenceClosure<NODE> result) {
		return checkJoinResult(CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), cc1),
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), cc2),
				CongruenceClosureSmtUtils.congruenceClosureToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkJoinResult(final WeqCongruenceClosure<NODE> weqcc1, final WeqCongruenceClosure<NODE> weqcc2,
			final WeqCongruenceClosure<NODE> result) {
		return checkJoinResult(weqCcToTerm(mMgdScript.getScript(), weqcc1), weqCcToTerm(mMgdScript.getScript(), weqcc2),
				weqCcToTerm(mMgdScript.getScript(), result));
	}

	private boolean checkJoinResult(final Term cc1, final Term cc2, final Term resultTerm) {
		// check that cc1 /\ cc2 -> result
		mMgdScript.lock(this);
		mMgdScript.echo(this, new QuotedObject("WeqCcManager.checkJoinResult (begin)"));

		final Script script = mMgdScript.getScript();
		final Term cc1AndCc2Term = SmtUtils.or(script, cc1, cc2);
		final boolean res = checkImplicationHolds(script, cc1AndCc2Term, resultTerm);

		mMgdScript.echo(this, new QuotedObject("WeqCcManager.checkJoinResult (end)"));
		mMgdScript.unlock(this);
		return res;
	}

	private boolean checkImplicationHolds(final Script script, final Term ante, final Term succ) {
		assert mMgdScript.isLockOwner(this);

		mMgdScript.push(this, 1);

		/*
		 * declare a constant for each variable and substitute the variables
		 */
		final Set<TermVariable> freeVars = new HashSet<>();
		freeVars.addAll(Arrays.asList(ante.getFreeVars()));
		freeVars.addAll(Arrays.asList(succ.getFreeVars()));

		final Map<Term, Term> subsMap = new HashMap<>();
		for (final TermVariable fv : freeVars) {
			// assuming the constant is already declared..
			mMgdScript.declareFun(this, fv.getName(), new Sort[0], fv.getSort());
			final Term cons = mMgdScript.term(this, fv.getName());
			subsMap.put(fv, cons);
		}

		final Substitution substitution = new Substitution(mMgdScript, subsMap);

		/*
		 * check the implication
		 */
		mMgdScript.assertTerm(this, substitution.transform(ante));

		mMgdScript.assertTerm(this, SmtUtils.not(script, substitution.transform(succ)));

		final LBool satResult = mMgdScript.checkSat(this);

		mMgdScript.pop(this, 1);

		assert satResult == LBool.UNSAT;
		return satResult == LBool.UNSAT;
	}

	public WeqCongruenceClosure<NODE> getWeqCongruenceClosure(final CongruenceClosure<NODE> cc,
			final WeakEquivalenceGraph<NODE> weqGraph, final boolean modifiable) {
		final CongruenceClosure<NODE> ccUnfrozen = mCcManager.unfreezeIfNecessary(cc);
		final WeqCongruenceClosure<NODE> result = new WeqCongruenceClosure<>(ccUnfrozen, weqGraph, this);

		if (!modifiable) {
			result.freeze();
		}
		return result;
	}

	public CongruenceClosure<NODE> getSingleEqualityCc(final NODE node1, final NODE node2, final boolean modifiable) {
		return mCcManager.getSingleEqualityCc(node1, node2, modifiable);
	}

	public CongruenceClosure<NODE> getSingleDisequalityCc(final NODE node1, final NODE node2, final boolean modifiable) {
		return mCcManager.getSingleDisequalityCc(node1, node2, modifiable);
	}

	public CongruenceClosure<NODE> getEmptyCc(final boolean modifiable) {
		return mCcManager.getEmptyCc(modifiable);
	}

	/**
	 * (keeps isFrozen()-status)
	 *
	 * @param cc
	 * @return
	 */
	public CongruenceClosure<NODE> copyCcNoRemInfo(final CongruenceClosure<NODE> cc) {
		final CongruenceClosure<NODE> result = mCcManager.copyNoRemInfo(cc);
		assert result.isFrozen() == cc.isFrozen();
//		if (WeqSettings.FREEZE_ALL_IN_MANAGER) {
//			if (!result.isFrozen()) {
//				result.freeze();
//			}
//		}
		return result;
	}

	public CongruenceClosure<NODE> copyCcNoRemInfoUnfrozen(final CongruenceClosure<NODE> cc) {
		return mCcManager.copyNoRemInfoUnfrozen(cc);
	}

	public CongruenceClosure<NODE> projectToElements(final CongruenceClosure<NODE> cc, final Set<NODE> nodesToKeep,
			final IRemovalInfo<NODE> remInfo) {
		return mCcManager.projectToElements(cc, nodesToKeep, remInfo);
	}

	public WeqCongruenceClosure<NODE> addAllElements(final WeqCongruenceClosure<NODE> weqcc,
			final Set<NODE> nodesToAdd, final IRemovalInfo<NODE> remInfo, final boolean inplace) {
		// TODO: use inplace flag
		assert !inplace : "TODO";
		if (WeqSettings.FREEZE_ALL_IN_MANAGER) {
			assert weqcc.isFrozen();
		} else {
			assert !weqcc.isFrozen();
		}

		assert !weqcc.isInconsistent();
		assert remInfo == null;

		final WeqCongruenceClosure<NODE> result = unfreeze(weqcc);

		for (final NODE e : nodesToAdd) {
			result.addElementRec(e);
		}

		assert result.sanityCheck();
		if (WeqSettings.FREEZE_ALL_IN_MANAGER) {
			result.freeze();
		}
		return result;
	}

	public CongruenceClosure<NODE> addAllElementsCc(final CongruenceClosure<NODE> cc,
			final Set<NODE> elemsToAdd, final IRemovalInfo<NODE> remInfo, final boolean inplace) {
		return mCcManager.addAllElements(cc, elemsToAdd, remInfo, inplace);
	}

	/**
	 * Given a (multidimensional) index, compute the corresponding annotation for a
	 * weak equivalence edge.
	 *
	 * Example: for (i1, .., in), this should return (q1 = i1, ..., qn = in) as a
	 * list of CongruenceClosures. (where qi is the variable returned by
	 * getWeqVariableForDimension(i))
	 *
	 * Always returns a frozen constraint (as of now..).
	 *
	 * @param nodes
	 * @return
	 */
	CongruenceClosure<NODE> computeWeqConstraintForIndex(final List<NODE> nodes) {
		final CongruenceClosure<NODE> result = getEmptyCc(true);
		for (int i = 0; i < nodes.size(); i++) {
			final NODE ithNode = nodes.get(i);
			final NODE weqVarNode = getWeqVariableNodeForDimension(i, ithNode.getTerm().getSort());
			reportEquality(result, weqVarNode, ithNode, true);
		}
		result.freeze();
		return result;
	}

	/**
	 * Obtain edge label of the form "q0 = i" where i is the parameter storeIndex.
	 *
	 * @param weakEquivalenceGraph
	 * @param storeIndex
	 * @return
	 */
	public WeakEquivalenceEdgeLabel<NODE> getEdgeLabelForIndex(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph,
			final NODE storeIndex) {
		return getSingletonEdgeLabel(weakEquivalenceGraph,
				computeWeqConstraintForIndex(Collections.singletonList(storeIndex)));
	}

	public WeakEquivalenceEdgeLabel<NODE> meetEdgeLabels(final WeakEquivalenceEdgeLabel<NODE> oldLabelCopy,
			final WeakEquivalenceEdgeLabel<NODE> labelToStrengthenWith, final boolean inplace) {
		// TODO Auto-generated method stub
		assert false;
		return null;
	}

	public WeakEquivalenceEdgeLabel<NODE> meetEdgeLabelsNonDestructive(
			final WeakEquivalenceEdgeLabel<NODE> oldLabelCopy,
			final WeakEquivalenceEdgeLabel<NODE> labelToStrengthenWith) {
		// TODO Auto-generated method stub
		assert false;
		return null;
	}

	public void freezeIfNecessary(final CongruenceClosure<NODE> cc) {
		mCcManager.freezeIfNecessary(cc);
	}

	public boolean isStrongerThan(final WeakEquivalenceEdgeLabel<NODE> oldLabelCopy,
			final WeakEquivalenceEdgeLabel<NODE> labelToStrengthenWith) {
		// TODO Auto-generated method stub
		assert false;
		return false;
	}

	public boolean isEquivalent(final WeakEquivalenceEdgeLabel<NODE> value,
			final WeakEquivalenceEdgeLabel<NODE> newLabel) {
		// TODO Auto-generated method stub
		assert false;
		return false;
	}

	public boolean isStrongerThan(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph,
			final WeakEquivalenceGraph<NODE> weakEquivalenceGraph2) {
		// freezing ensures closure
		freezeIfNecessary(weakEquivalenceGraph);
		freezeIfNecessary(weakEquivalenceGraph2);

		return weakEquivalenceGraph.isStrongerThan(weakEquivalenceGraph2);
	}

	private void freezeIfNecessary(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph) {
		if (!weakEquivalenceGraph.isFrozen()) {
			weakEquivalenceGraph.freeze();
		}
	}

	public WeakEquivalenceGraph<NODE> join(final WeakEquivalenceGraph<NODE> weakEquivalenceGraph,
			final WeakEquivalenceGraph<NODE> weakEquivalenceGraph2,
			final boolean modifiable) {
		freezeIfNecessary(weakEquivalenceGraph);
		freezeIfNecessary(weakEquivalenceGraph2);

		final WeakEquivalenceGraph<NODE> result = weakEquivalenceGraph.join(weakEquivalenceGraph2);

		if (!modifiable) {
			result.freeze();
		}

		return result;
	}
}
