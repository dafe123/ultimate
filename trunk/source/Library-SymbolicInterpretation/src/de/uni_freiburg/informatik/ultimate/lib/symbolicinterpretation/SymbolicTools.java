/*
 * Copyright (C) 2019 Claus Schätzle (schaetzc@tf.uni-freiburg.de)
 * Copyright (C) 2019 University of Freiburg
 *
 * This file is part of the ULTIMATE Library-SymbolicInterpretation plug-in.
 *
 * The ULTIMATE Library-SymbolicInterpretation plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * The ULTIMATE Library-SymbolicInterpretation plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Library-SymbolicInterpretation plug-in. If not, see <http://www.gnu.org/licenses/>.
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Library-SymbolicInterpretation plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP),
 * containing parts covered by the terms of the Eclipse Public License, the
 * licensors of the ULTIMATE Library-SymbolicInterpretation plug-in grant you additional permission
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.lib.symbolicinterpretation;

import java.util.Collection;
import java.util.Optional;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger.LogLevel;
import de.uni_freiburg.informatik.ultimate.core.model.services.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.CfgSmtToolkit;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfg;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgCallTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgReturnTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IcfgLocation;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.transitions.TransFormula;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.PartialQuantifierElimination;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils.SimplificationTechnique;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils.XnfConversionTechnique;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.managedscript.ManagedScript;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.IPredicate;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.PredicateTransformer;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.TermDomainOperationProvider;
import de.uni_freiburg.informatik.ultimate.logic.Script;
import de.uni_freiburg.informatik.ultimate.logic.Script.LBool;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.plugins.generator.traceabstraction.predicates.PredicateFactory;

/**
 * Helper class to create and transform terms/formulas/predicates.
 *
 * @author schaetzc@tf.uni-freiburg.de
 */
public class SymbolicTools {

	private final IIcfg<IcfgLocation> mIcfg;
	private final ManagedScript mMngdScript;
	private final PredicateFactory mFactory;
	private final PredicateTransformer<Term, IPredicate, TransFormula> mTransformer;
	private final IPredicate mTop;
	private final IPredicate mBottom;
	private final SimplificationTechnique mSimplification;
	private final IUltimateServiceProvider mServices;
	private final ILogger mPQELogger;

	public SymbolicTools(final IUltimateServiceProvider services, final IIcfg<IcfgLocation> icfg,
			final SimplificationTechnique simplification) {
		mIcfg = icfg;
		mServices = services;

		// create PQE logger with custom log level
		mPQELogger = services.getLoggingService().getLogger(getClass().getName() + ".PQE");
		mPQELogger.setLevel(LogLevel.WARN);

		mSimplification = simplification;
		mMngdScript = icfg.getCfgSmtToolkit().getManagedScript();
		final Script script = mMngdScript.getScript();
		mFactory = new PredicateFactory(services, mMngdScript, icfg.getCfgSmtToolkit().getSymbolTable());
		mTransformer = new PredicateTransformer<>(mMngdScript,
				new EliminatingTermDomainOperationProvider(services, mPQELogger, mMngdScript));
		mTop = mFactory.newPredicate(script.term("true"));
		mBottom = mFactory.newPredicate(script.term("false"));
	}

	public ManagedScript getManagedScript() {
		return mMngdScript;
	}

	public Script getScript() {
		return mMngdScript.getScript();
	}

	public PredicateFactory getFactory() {
		return mFactory;
	}

	public IPredicate post(final IPredicate input, final IIcfgTransition<IcfgLocation> transition) {
		return mFactory.newPredicate(mTransformer.strongestPostcondition(input, transition.getTransformula()));
	}

	/**
	 * Assigns arguments to parameters of the callee. Also handles globals and old vars.
	 */
	public IPredicate postCall(final IPredicate input, final IIcfgCallTransition<IcfgLocation> transition) {
		final CfgSmtToolkit toolkit = mIcfg.getCfgSmtToolkit();
		final String calledProcedure = transition.getSucceedingProcedure();
		final Term sp = mTransformer.strongestPostconditionCall(input, transition.getLocalVarsAssignment(),
				toolkit.getOldVarsAssignmentCache().getGlobalVarsAssignment(calledProcedure),
				toolkit.getOldVarsAssignmentCache().getOldVarsAssignment(calledProcedure),
				toolkit.getModifiableGlobalsTable().getModifiedBoogieVars(calledProcedure));
		Term predicateTerm;
		if (transition.getTransformula().getAuxVars().isEmpty()) {
			predicateTerm = sp;
		} else {
			// 2018-08-17 DD:
			// Temporary workaround for aux-var in transition issue: remove it afterwards through ex. proj.
			predicateTerm = PartialQuantifierElimination.quantifier(mServices, mPQELogger, mMngdScript, mSimplification,
					XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION, Script.EXISTS,
					transition.getTransformula().getAuxVars(), sp);
		}
		return mFactory.newPredicate(predicateTerm);
	}

	/**
	 * Assigns the return values from the callee to local variables of the caller. Also handles globals and old vars.
	 */
	public IPredicate postReturn(final IPredicate inputBeforeCall, final IPredicate inputBeforeReturn,
			final IIcfgReturnTransition<IcfgLocation, IIcfgCallTransition<IcfgLocation>> returnTransition) {
		final CfgSmtToolkit toolkit = mIcfg.getCfgSmtToolkit();
		final String callee = returnTransition.getPrecedingProcedure();
		return mFactory.newPredicate(mTransformer.strongestPostconditionReturn(inputBeforeReturn, inputBeforeCall,
				returnTransition.getTransformula(), returnTransition.getCorrespondingCall().getTransformula(),
				toolkit.getOldVarsAssignmentCache().getOldVarsAssignment(callee),
				toolkit.getModifiableGlobalsTable().getModifiedBoogieVars(callee)));
	}

	public Term[] dnfDisjuncts(final IPredicate pred) {
		// TODO consider using QuantifierPusher to push quantifiers as inward as possible

		// you can ensure that there are no let terms by using the unletter, but there should not be any let terms
		// final Term unletedTerm = new FormulaUnLet().transform(pred.getFormula());

		final Term dnf = SmtUtils.toDnf(mServices, mMngdScript, pred.getFormula(),
				SmtUtils.XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION);
		return SmtUtils.getDisjuncts(dnf);
	}

	public IPredicate top() {
		return mTop;
	}

	public IPredicate bottom() {
		return mBottom;
	}

	public IPredicate or(final IPredicate... operands) {
		return mFactory.or(mSimplification, operands);
	}

	public IPredicate or(final Term... operands) {
		return mFactory.orT(mSimplification, operands);
	}

	public IPredicate or(final Collection<Term> operands) {
		return mFactory.orT(mSimplification, operands);
	}

	public IPredicate and(final IPredicate... operands) {
		return mFactory.and(mSimplification, operands);
	}

	public IPredicate and(final Term... operands) {
		return mFactory.andT(mSimplification, operands);
	}

	public IPredicate and(final Collection<Term> operands) {
		return mFactory.andT(mSimplification, operands);
	}

	public Optional<Boolean> isFalse(final IPredicate pred) {
		// TODO: Use unifier instead of costly SMT check
		if (mBottom.equals(pred)) {
			return Optional.of(true);
		}
		final LBool result = SmtUtils.checkSatTerm(mMngdScript.getScript(), pred.getClosedFormula());
		return satAsBool(result).map(b -> !b);
	}

	public Optional<Boolean> implies(final IPredicate p1, final IPredicate p2) {
		// TODO: Use unifier instead of costly SMT check
		if (p1.equals(p2)) {
			return Optional.of(true);
		}
		final Script script = mMngdScript.getScript();
		final Term negImplTerm =
				SmtUtils.not(script, SmtUtils.implies(script, p1.getClosedFormula(), p2.getClosedFormula()));
		final LBool result = SmtUtils.checkSatTerm(script, negImplTerm);
		return satAsBool(result).map(b -> !b);
	}

	private static Optional<Boolean> satAsBool(final LBool solverResult) {
		switch (solverResult) {
		case SAT:
			return Optional.of(true);
		case UNSAT:
			return Optional.of(false);
		case UNKNOWN:
			return Optional.empty();
		default:
			throw new AssertionError("Missing case: " + solverResult);
		}
	}

	/**
	 * A {@link TermDomainOperationProvider} for {@link PredicateTransformer} that tries to eliminate all quantifiers
	 * during projection.
	 *
	 * It also logs only warning messages for PQE to avoid polluting the log.
	 *
	 * @author Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
	 *
	 */
	private static final class EliminatingTermDomainOperationProvider extends TermDomainOperationProvider {

		private final ILogger mPQELogger;

		public EliminatingTermDomainOperationProvider(final IUltimateServiceProvider services, final ILogger logger,
				final ManagedScript mgdScript) {
			super(services, mgdScript);
			mPQELogger = logger;
		}

		@Override
		public Term projectExistentially(final Set<TermVariable> varsToProjectAway, final Term constraint) {
			return constructQuantifiedFormula(Script.EXISTS, varsToProjectAway, constraint);
		}

		@Override
		public Term projectUniversally(final Set<TermVariable> varsToProjectAway, final Term constraint) {
			return constructQuantifiedFormula(Script.FORALL, varsToProjectAway, constraint);
		}

		private Term constructQuantifiedFormula(final int quantifier, final Set<TermVariable> varsToQuantify,
				final Term term) {
			return PartialQuantifierElimination.quantifier(mServices, mPQELogger, mMgdScript,
					SimplificationTechnique.NONE, XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION,
					quantifier, varsToQuantify, term);
		}

	}

}
