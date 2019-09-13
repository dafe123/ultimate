/*
 * Copyright (C) 2018 Jonas Werner (jonaswerner95@gmail.com)
 * Copyright (C) 2018 University of Freiburg
 *
 * This file is part of the ULTIMATE PDR library .
 *
 * The ULTIMATE IcfgTransformer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * The ULTIMATE IcfgTransformer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE PDR library . If not, see <http://www.gnu.org/licenses/>.
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE PDR library , or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP),
 * containing parts covered by the terms of the Eclipse Public License, the
 * licensors of the ULTIMATE PDR library grant you additional permission
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.lib.pdr;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import de.uni_freiburg.informatik.ultimate.core.lib.exceptions.ToolchainCanceledException;
import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import de.uni_freiburg.informatik.ultimate.core.model.services.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.core.model.translation.IProgramExecution;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.CfgSmtToolkit;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.IIcfgSymbolTable;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.IcfgUtils;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.ModifiableGlobalsTable;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IAction;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.ICallAction;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfg;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgCallTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgInternalTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgReturnTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IIcfgTransition;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IInternalAction;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IReturnAction;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IcfgEdge;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IcfgLocation;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.structure.IcfgLocationIterator;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.transitions.TransFormula;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.transitions.UnmodifiableTransFormula;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.variables.IProgramNonOldVar;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.variables.IProgramOldVar;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.cfg.variables.IProgramVar;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.hoaretriple.IHoareTripleChecker;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.hoaretriple.IHoareTripleChecker.Validity;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.PartialQuantifierElimination;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils.SimplificationTechnique;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SmtUtils.XnfConversionTechnique;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SolverBuilder;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SolverBuilder.SolverMode;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.SolverBuilder.SolverSettings;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.Substitution;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.interpolant.IInterpolatingTraceCheck;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.interpolant.InterpolantComputationStatus;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.interpolant.InterpolantComputationStatus.ItpErrorStatus;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.managedscript.ManagedScript;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.IPredicate;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.IPredicateUnifier;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.PredicateTransformer;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.PredicateUtils;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.predicates.TermDomainOperationProvider;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.tracecheck.ITraceCheckPreferences;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.tracecheck.TraceCheckReasonUnknown;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.tracecheck.TraceCheckReasonUnknown.ExceptionHandlingCategory;
import de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.smt.tracecheck.TraceCheckReasonUnknown.Reason;
import de.uni_freiburg.informatik.ultimate.lib.pdr.PdrBenchmark.PdrStatisticsDefinitions;
import de.uni_freiburg.informatik.ultimate.logic.Logics;
import de.uni_freiburg.informatik.ultimate.logic.SMTLIBException;
import de.uni_freiburg.informatik.ultimate.logic.Script;
import de.uni_freiburg.informatik.ultimate.logic.Script.LBool;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.plugins.generator.rcfgbuilder.cfg.PathProgram;
import de.uni_freiburg.informatik.ultimate.plugins.generator.rcfgbuilder.cfg.PathProgram.PathProgramConstructionResult;
import de.uni_freiburg.informatik.ultimate.util.datastructures.relation.Pair;
import de.uni_freiburg.informatik.ultimate.util.datastructures.relation.Triple;
import de.uni_freiburg.informatik.ultimate.util.statistics.IStatisticsDataProvider;

/**
 *
 * @author Jonas Werner (jonaswerner95@gmail.com)
 *
 */
public class Pdr<LETTER extends IIcfgTransition<?>> implements IInterpolatingTraceCheck<LETTER> {

	/**
	 * To indicate whether a frame has been changed. It is possible to add "true" to frames, but that was ignored in the
	 * propagation phase.
	 */
	private enum ChangedFrame {
		C, U
	}

	/**
	 * How to deal with procedures.
	 */
	private enum DealWithProcedures {
		THROW_EXCEPTION, CONTINUE
	}

	private static final boolean USE_INTERPOLATION = true;
	private static final boolean USE_ICFGBUILDER_SOLVER = true;

	/**
	 * Currently we cannot handle procedures.
	 */
	private final DealWithProcedures mDealWithProcedures = DealWithProcedures.CONTINUE;

	private final ILogger mLogger;
	private final IUltimateServiceProvider mServices;
	private Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> mGlobalFrames;
	private final ManagedScript mScript;
	private final PredicateTransformer<Term, IPredicate, TransFormula> mPredTrans;
	private final IIcfg<? extends IcfgLocation> mIcfg;
	private final IIcfg<? extends IcfgLocation> mPpIcfg;
	private final CfgSmtToolkit mCsToolkit;
	private final IHoareTripleChecker mHtc;
	private final IPredicateUnifier mPredicateUnifier;
	private final IPredicate mTruePred;
	private final IPredicate mFalsePred;
	private final List<LETTER> mTrace;
	private final PdrBenchmark mPdrBenchmark;
	private final IIcfgSymbolTable mSymbolTable;
	private final IPredicate mAxioms;
	/*
	 * Pair of proof-obligations that lead to PDR returning SAT an iteration before. First is that obligation, second is
	 * the one with correct pre.
	 */
	private final Deque<Pair<ProofObligation, ProofObligation>> mSatProofObligations;

	private boolean mTraceCheckFinishedNormally;
	private IProgramExecution<IIcfgTransition<IcfgLocation>, Term> mFeasibleProgramExecution;
	private ToolchainCanceledException mToolchainCanceledException;
	private LBool mIsTraceCorrect;
	private IPredicate[] mInterpolants;
	private TraceCheckReasonUnknown mReasonUnknown;
	private int mInvarSpot;
	private int mLevel;

	public Pdr(final ILogger logger, final ITraceCheckPreferences prefs, final IPredicateUnifier predicateUnifier,
			final IHoareTripleChecker htc, final List<LETTER> counterexample) {
		// from params
		mLogger = logger;
		mPredicateUnifier = predicateUnifier;
		mHtc = htc;
		mTrace = counterexample;

		mInvarSpot = -1;
		mLevel = 0;

		// stuff from prefs
		mServices = prefs.getUltimateServices();
		mIcfg = prefs.getIcfgContainer();

		mSymbolTable = mIcfg.getCfgSmtToolkit().getSymbolTable();

		// stuff initialized here
		mPdrBenchmark = new PdrBenchmark();

		final PathProgramConstructionResult pp =
				PathProgram.constructPathProgram("errorPP", mIcfg, new HashSet<>(counterexample));

		mPpIcfg = pp.getPathProgram();
		mCsToolkit = mPpIcfg.getCfgSmtToolkit();

		mScript = createSolver(mServices, mCsToolkit);
		mPredTrans = new PredicateTransformer<>(mScript, new TermDomainOperationProvider(mServices, mScript));

		mAxioms = mPredicateUnifier.getOrConstructPredicate(mCsToolkit.getSmtFunctionsAndAxioms().getAxioms());

		mTruePred = mPredicateUnifier.getOrConstructPredicate(mScript.getScript().term("true"));
		mFalsePred = mPredicateUnifier.getOrConstructPredicate(mScript.getScript().term("false"));
		mGlobalFrames = initializeFrames(mPpIcfg);
		mSatProofObligations = new ArrayDeque<Pair<ProofObligation, ProofObligation>>();
		mLogger.info("Analyzing path program with PDR");

		try {
			mPdrBenchmark.start(PdrStatisticsDefinitions.PDR_RUNTIME);
			mIsTraceCorrect = pdrPreprocessing(mPpIcfg);
			mLogger.info("Finished analyzing path program with PDR");
			mTraceCheckFinishedNormally = true;
			mReasonUnknown = null;
		} catch (final ToolchainCanceledException tce) {
			mTraceCheckFinishedNormally = false;
			mIsTraceCorrect = LBool.UNKNOWN;
			mToolchainCanceledException = tce;
			mReasonUnknown = new TraceCheckReasonUnknown(Reason.ULTIMATE_TIMEOUT, tce,
					ExceptionHandlingCategory.KNOWN_DEPENDING);
		} catch (final SMTLIBException e) {
			mTraceCheckFinishedNormally = false;
			mIsTraceCorrect = LBool.UNKNOWN;
			mReasonUnknown = TraceCheckReasonUnknown.constructReasonUnknown(e);
		} finally {
			mPdrBenchmark.stop(PdrStatisticsDefinitions.PDR_RUNTIME);
		}
	}

	private final LBool pdrPreprocessing(final IIcfg<? extends IcfgLocation> icfg) {

		final Set<? extends IcfgLocation> init = icfg.getInitialNodes();
		final Set<? extends IcfgLocation> error = IcfgUtils.getErrorLocations(mPpIcfg);
		/**
		 * Check for 0-Counter-Example
		 */
		for (final IcfgLocation initNode : init) {
			if (error.contains(initNode)) {
				mLogger.debug("Error is reachable.");
				return LBool.SAT;
			}
			for (final IcfgEdge loc : initNode.getOutgoingEdges()) {
				if (error.contains(loc.getTarget())) {
					if (mAxioms != null) {
						final Set<IProgramNonOldVar> modifiableGlobals = mCsToolkit.getModifiableGlobalsTable()
								.getModifiedBoogieVars(loc.getPrecedingProcedure());

						final LBool res = PredicateUtils.isInductiveHelper(mScript.getScript(), mTruePred, not(mAxioms),
								loc.getTransformula(), modifiableGlobals, modifiableGlobals);

						if (res == LBool.UNSAT) {
							mInvarSpot = 0;
							mInterpolants = computeInterpolants();
							return LBool.UNSAT;
						}
					}
					return LBool.SAT;
				}
			}
		}

		final ArrayDeque<ProofObligation> firstPos = new ArrayDeque<>();
		/**
		 * Generate the initial proof-obligations
		 */
		for (final IcfgEdge edge : error.iterator().next().getIncomingEdges()) {
			final Term sp = mPredTrans.pre(mTruePred, edge.getTransformula());
			final IPredicate proofObligationPred = mPredicateUnifier.getPredicateFactory().newPredicate(sp);
			final ProofObligation initialProofObligation =
					new ProofObligation(proofObligationPred, edge.getSource(), 0);

			firstPos.add(initialProofObligation);
		}

		final LBool result = computePdr(icfg, firstPos);
		if (result == LBool.UNSAT) {

			mInterpolants = computeInterpolants();

			if (mLogger.isDebugEnabled()) {
				mLogger.debug("Interpolants are");
				int i = 0;
				mLogger.debug("{true}");
				for (final LETTER letter : mTrace) {
					mLogger.debug(letter);

					if (i != mTrace.size() - 1) {
						mLogger.debug("%s {%s}", letter.getTarget(), mInterpolants[i]);
					}
					++i;
				}
				mLogger.debug("{false}");
			}
		}

		return result;
	}

	/**
	 * Main loop of PDR
	 *
	 * @param icfg
	 * @return
	 */
	private LBool computePdr(final IIcfg<? extends IcfgLocation> icfg, final Deque<ProofObligation> firstPos) {

		/**
		 * Initialize level 0.
		 */
		final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames = initializeFrames(icfg);
		int localLevel = 0;

		while (true) {
			if (!mServices.getProgressMonitorService().continueProcessing()) {
				throw new ToolchainCanceledException(getClass(), "Timeout or canceled while running Pdr");
			}
			/**
			 * Initialize new level.
			 */
			final Deque<ProofObligation> proofObligations = new ArrayDeque<>(firstPos);
			for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> trace : localFrames.entrySet()) {
				trace.getValue().add(new Pair<>(ChangedFrame.U, mAxioms));
			}

			localLevel += 1;

			/**
			 * Generated proof-obligation on level 0 -> error reachable
			 */
			if (!blockingPhase(proofObligations, localFrames, localLevel)) {
				if (mLogger.isDebugEnabled()) {
					mLogger.debug(
							"Error trace found. Frames: " + localFrames.entrySet().stream()
									.map(a -> a.getKey().getDebugIdentifier() + ": {"
											+ a.getValue().stream().map(Pair<ChangedFrame, IPredicate>::toString)
													.collect(Collectors.joining(","))
											+ "}")
									.collect(Collectors.joining(",")));
				}
				mLogger.debug("Error is reachable.");
				// updateGlobalFrames(localFrames, localLevel);
				return LBool.SAT;
			}

			/**
			 * Found a global fixpoint position -> error not reachable
			 */
			if (propagationPhase(localFrames)) {
				if (mLogger.isDebugEnabled()) {
					mLogger.debug("Frames:");
					for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> entry : localFrames
							.entrySet()) {
						mLogger.debug("  " + entry.getKey().getDebugIdentifier() + ": " + entry.getValue().stream()
								.map(Pair<ChangedFrame, IPredicate>::toString).collect(Collectors.joining(",")));
					}
					mLogger.debug("PP:");
					mLogger.debug("  " + new IcfgLocationIterator<>(mPpIcfg).asStream()
							.map(a -> a.getDebugIdentifier().toString()).collect(Collectors.joining(",")));
					mLogger.debug("Error is not reachable.");
				}
				updateGlobalFrames(localFrames, localLevel);
				return LBool.UNSAT;
			}
		}
	}

	/**
	 * Blocking-phase, for blocking proof-obligations.
	 *
	 * @return false, if proof-obligation on level 0 is created true, if there is no proof-obligation left
	 */
	private final boolean blockingPhase(final Deque<ProofObligation> proofObligations,
			Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames, int localLevel) {

		mLogger.debug("Begin Blocking Phase: on Level: " + mLevel);

		while (!proofObligations.isEmpty()) {

			if (mLogger.isDebugEnabled()) {
				mLogger.debug("# of proof-obligations: " + proofObligations.size());
			}

			final ProofObligation proofObligation = proofObligations.pop();
			final IPredicate toBeBlocked = proofObligation.getToBeBlocked();
			final IcfgLocation location = proofObligation.getLocation();
			final int level = localLevel - proofObligation.getLevel();

			if (mLogger.isDebugEnabled()) {
				mLogger.debug("ProofObligation: " + proofObligation);
				mLogger.debug("predecessors: " + location.getIncomingNodes());
			}
			for (final IcfgEdge predecessorTransition : location.getIncomingEdges()) {
				final IcfgLocation predecessor = predecessorTransition.getSource();
				final IPredicate predecessorFrame = localFrames.get(predecessor).get(level - 1).getSecond();
				final Triple<IPredicate, IAction, IPredicate> query =
						new Triple<>(predecessorFrame, predecessorTransition, toBeBlocked);

				/*
				 * Check whether the proofobligation has already been blocked to skip the rest.
				 */
				// if (proofObligation.getBlockedQueries().contains(query)) {
				// mLogger.debug("Query already blocked.");
				// updateFrames(toBeBlocked, location, level);
				// continue;
				// }

				/*
				 * Dealing with internal transitions:
				 */
				if (predecessorTransition instanceof IIcfgInternalTransition) {
					final Set<IProgramNonOldVar> modifiableGlobals = mCsToolkit.getModifiableGlobalsTable()
							.getModifiedBoogieVars(predecessorTransition.getPrecedingProcedure());
					final UnmodifiableTransFormula predTF = predecessorTransition.getTransformula();
					/*
					 * Check frame /\ transtion /\ proofobligation' for satisfiability) Note: the query says
					 * not(proof-obligation) because of the nature of isInductiveHelper.
					 */
					if (mLogger.isDebugEnabled()) {
						mLogger.debug(String.format("Checking %s and %s and %s for satisfiability", predecessorFrame,
								predecessorTransition, toBeBlocked));
					}
					final LBool res = PredicateUtils.isInductiveHelper(mScript.getScript(), predecessorFrame,
							not(toBeBlocked), predTF, modifiableGlobals, modifiableGlobals);

					if (mLogger.isDebugEnabled()) {
						mLogger.debug(String.format("Is %s", res));
					}
					/*
					 * Query is satisfiable: generate new proofobligation
					 */
					if (res == LBool.SAT) {
						Term pre = mPredTrans.pre(toBeBlocked, predTF);
						pre = PartialQuantifierElimination.tryToEliminate(mServices, mLogger, mScript, pre,
								SimplificationTechnique.SIMPLIFY_DDA,
								XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION);

						final IPredicate prePred = mPredicateUnifier.getOrConstructPredicate(pre);
						final ProofObligation newProofObligation =
								new ProofObligation(prePred, predecessor, localLevel - level + 1);

						if (level - 1 == 0) {
							mSatProofObligations.add(
									new Pair<ProofObligation, ProofObligation>(proofObligation, newProofObligation));
							return false;
						}

						proofObligations.addFirst(proofObligation);
						proofObligations.addFirst(newProofObligation);

						if (mLogger.isDebugEnabled()) {
							mLogger.debug(
									String.format("pre(%s, %s) == %s", toBeBlocked, predecessorTransition, prePred));
						}

						/*
						 * Query is not satisfiable: strengthen the frames of location.
						 */
					} else if (res == LBool.UNSAT) {
						if (USE_INTERPOLATION
								&& predecessorTransition.getTransformula().getFormula() != mTruePred.getFormula()) {
							final IPredicate interpolant =
									getInterpolant(predecessorTransition, predecessorFrame, toBeBlocked);
							if (interpolant != null) {
								final Term pred = SmtUtils.and(mScript.getScript(), not(interpolant).getFormula(),
										toBeBlocked.getFormula());
								updateLocalFrames(mPredicateUnifier.getOrConstructPredicate(pred), location, level,
										localFrames);
							} else {
								updateLocalFrames(toBeBlocked, location, level, localFrames);
							}
						} else {
							updateLocalFrames(toBeBlocked, location, level, localFrames);
						}
						proofObligation.addBlockedQuery(query);
					} else {
						mLogger.error(String.format("Internal query %s && %s && %s was unknown!", predecessorFrame,
								predecessorTransition, toBeBlocked));
						throw new UnsupportedOperationException("Solver returned unknown");
					}

					/*
					 * Dealing with procedure calls TODO:
					 */
				} else if (predecessorTransition instanceof IIcfgCallTransition) {
					if (mDealWithProcedures.equals(DealWithProcedures.THROW_EXCEPTION)) {
						throw new UnsupportedOperationException("Cannot deal with procedures");
					}

					if (mLogger.isDebugEnabled()) {
						mLogger.debug("Found Call");
					}

					/*
					 * Dealing with procedure returns TODO:
					 */
				} else if (predecessorTransition instanceof IIcfgReturnTransition) {
					if (mDealWithProcedures.equals(DealWithProcedures.THROW_EXCEPTION)) {
						throw new UnsupportedOperationException("Cannot deal with procedures");
					}
					if (mLogger.isDebugEnabled()) {
						mLogger.debug("Found return, starting PDR for proceedure: %s",
								predecessorTransition.getSource().getProcedure());
					}
					final IIcfgReturnTransition<?, ?> returnTrans = (IIcfgReturnTransition<?, ?>) predecessorTransition;
					/**
					 * Get the procedure in form of a trace.
					 */
					final List<LETTER> procTrace = getProcedureTrace(returnTrans);
					final PathProgramConstructionResult pp =
							PathProgram.constructPathProgram("procErrorPP", mIcfg, new HashSet<>(procTrace));
					final Set<IcfgLocation> errorLocOfProc = new HashSet<>();
					errorLocOfProc.add(returnTrans.getTarget());

					final ArrayDeque<ProofObligation> procedurePo = new ArrayDeque<>();
					final ProofObligation initialProofObligation =
							new ProofObligation(proofObligation.getToBeBlocked(), predecessorTransition.getSource(), 0);

					procedurePo.add(initialProofObligation);

					LBool procResult = computePdr(pp.getPathProgram(), procedurePo);

					/*
					 * Recursive PDR call returns SAT -> error can be reached by calling this procedure. In this case we
					 * need the last proofobligation of the procedure to start another PDR call on the remainder of the
					 * program. Otherwise we cannot block the proofobligation that lead to the procedure.
					 */
					if (procResult == LBool.SAT) {
						if (mLogger.isDebugEnabled()) {
							mLogger.debug("Procedure can lead to Error!");
						}
						final Pair<ProofObligation, ProofObligation> procSatProofObligations =
								mSatProofObligations.pop();

						final ProofObligation oldProofObligation = procSatProofObligations.getFirst();
						final ProofObligation newProofObligation = procSatProofObligations.getSecond();
						final IcfgLocation newLocation = returnTrans.getCallerProgramPoint();

						final ProofObligation newLocalProofObligation = new ProofObligation(
								newProofObligation.getToBeBlocked(), newLocation, proofObligation.getLevel());

						final List<LETTER> subTrace = getSubTrace(newLocation);
						if (mLogger.isDebugEnabled()) {
							mLogger.debug("Beginning recursive PDR");
						}
						/**
						 * Get the rest of the program as a trace.
						 */
						final PathProgramConstructionResult subPP =
								PathProgram.constructPathProgram("procErrorPP", mIcfg, new HashSet<>(subTrace));
						final ArrayDeque<ProofObligation> subTracePo = new ArrayDeque<>();
						subTracePo.add(newLocalProofObligation);
						final LBool subTraceResult = computePdr(subPP.getPathProgram(), subTracePo);

						/**
						 * The rest of the program proves that the precondition needed for the procedure to lead to the
						 * error cannot be created. Which means, updating global frames and redo the procedure PDR to
						 * check if the error is now unreachable. If so try to block the proof-obligation that found the
						 * return. TODO: Propagate newly information of susequent PDR calls back to procedure. -> Change
						 * how frames are initialized.
						 */
						if (subTraceResult == LBool.UNSAT) {
							mLogger.debug("Recursive is unsat");
							updateLocalFrames(newLocalProofObligation.getToBeBlocked(),
									((IIcfgReturnTransition<?, ?>) predecessorTransition).getCorrespondingCall()
											.getTarget(),
									localLevel, localFrames);
							updateGlobalFrames(localFrames, localLevel);
							procResult = computePdr(pp.getPathProgram(), procedurePo);
							proofObligations.addFirst(proofObligation);

							/**
							 * The rest of the program can make the precondition possible -> proof-obligation cannot be
							 * blocked, whole program is unsafe.
							 * 
							 * TODO
							 */
						} else if (subTraceResult == LBool.SAT) {
							mLogger.debug("SAT");
						}

					}

					/*
					 * Procedure PDR call returns UNSAT -> error cannot be reached by calling this procedure.
					 */
					else if (procResult == LBool.UNSAT) {
						if (mLogger.isDebugEnabled()) {
							mLogger.debug("Procedure can not lead to Error!");
						}
						updateLocalFrames(toBeBlocked, location, level, localFrames);
						if (mLogger.isDebugEnabled()) {
							mLogger.debug("Return to procedure");
						}
					} else {
						mLogger.error(String.format("Internal query %s && %s && %s was unknown!", predecessorFrame,
								predecessorTransition, toBeBlocked));
						throw new UnsupportedOperationException("Solver returned unknown");
					}
				} else {
					throw new UnsupportedOperationException(
							"Unknown transition type: " + predecessorTransition.getClass().toString());
				}
			}
		}
		updateGlobalFrames(localFrames, localLevel);
		return true;

	}

	/**
	 * Compute Interpolant of unsatisfiable query to add to the frames. We have predecessorFrame /\
	 * predecessorTransition /\ prePred == UNSAT
	 *
	 * @param predecessorTransition
	 * @param predecessorFrame
	 * @param prePred
	 * @return
	 * @throws AssertionError
	 */
	private IPredicate getInterpolant(final IcfgEdge predecessorTransition, final IPredicate predecessorFrame,
			final IPredicate prePred) throws AssertionError {

		final Term frameAndTrans = andPredTf(mScript.getScript(), predecessorFrame,
				predecessorTransition.getTransformula(), mCsToolkit.getModifiableGlobalsTable()
						.getModifiedBoogieVars(predecessorTransition.getPrecedingProcedure()));

		if (mLogger.isDebugEnabled()) {
			mLogger.debug(String.format("Converted frame %s and transformula %s to %s", predecessorFrame,
					predecessorTransition.getTransformula(), frameAndTrans));
		}

		Term equalities = mTruePred.getFormula();

		// final IPredicate frameAndTransPred = mPredicateUnifier.getOrConstructPredicate(frameAndTrans);

		final Set<IProgramVar> ppVars = prePred.getVars();
		final Map<Term, Term> substitutionMappingPrePred = new HashMap<>();
		final Map<Term, Term> substitutionMappingTrans = new HashMap<>();
		final Map<Term, Term> reverseMappingPrePred = new HashMap<>();
		final Map<IProgramVar, TermVariable> outVarsTrans =
				new HashMap<>(predecessorTransition.getTransformula().getOutVars());
		/*
		 * Replace vars with primed vars in prePred
		 */
		for (final IProgramVar var : ppVars) {
			substitutionMappingPrePred.put(var.getDefaultConstant(), var.getPrimedConstant());
			reverseMappingPrePred.put(var.getPrimedConstant(), var.getTermVariable());
		}
		final ArrayList<Term> tfConstants = new ArrayList<Term>();
		final ArrayList<Term> tfConstantsPrimed = new ArrayList<Term>();

		for (final IProgramVar outVar : outVarsTrans.keySet()) {
			tfConstants.add(outVar.getDefaultConstant());
			tfConstantsPrimed.add(outVar.getPrimedConstant());
		}
		for (final IProgramVar var : predecessorFrame.getVars()) {
			tfConstants.add(var.getDefaultConstant());
			tfConstantsPrimed.add(var.getPrimedConstant());
		}

		equalities = SmtUtils.and(mScript.getScript(), equalities,
				SmtUtils.pairwiseEquality(mScript.getScript(), tfConstants, tfConstantsPrimed));
		/*
		 * Replace outVars with primed constants in frame /\ pred.
		 */
		for (final TermVariable outVar : frameAndTrans.getFreeVars()) {
			final IProgramVar pv = mSymbolTable.getProgramVar(outVar);
			if (outVarsTrans.containsKey(pv)) {
				substitutionMappingTrans.put(pv.getDefaultConstant(), pv.getPrimedConstant());
				reverseMappingPrePred.put(pv.getPrimedConstant(), pv.getTermVariable());
			}
		}

		final Term transformedPrePred =
				new Substitution(mScript, substitutionMappingPrePred).transform(prePred.getClosedFormula());

		Term transformedTrans = new Substitution(mScript, substitutionMappingTrans).transform(frameAndTrans);
		transformedTrans = SmtUtils.and(mScript.getScript(), transformedTrans, equalities);

		final Pair<LBool, Term> interpolPair =
				SmtUtils.interpolateBinary(mScript.getScript(), transformedTrans, transformedPrePred);

		if (interpolPair.getFirst() == LBool.UNKNOWN) {
			return null;
		}

		if (interpolPair.getFirst() == LBool.SAT) {
			throw new AssertionError(
					String.format("Wrong interpolation query (is sat): Renamed FrameAndTrans: %s Renamed Pre: %s",
							transformedTrans, transformedPrePred));
		}

		// unprime
		final Term transformedInterpolant =
				new Substitution(mScript, reverseMappingPrePred).transform(interpolPair.getSecond());

		final IPredicate interpolatedPreCondition = mPredicateUnifier.getOrConstructPredicate(transformedInterpolant);
		if (mLogger.isDebugEnabled()) {
			mLogger.debug(String.format("Interpolant: %s (%s from binInt(%s  %s))", interpolatedPreCondition,
					interpolPair.getSecond(), transformedPrePred, frameAndTrans));
		}
		return interpolatedPreCondition;
	}

	/**
	 * Generate a new proofobligation
	 *
	 * @param proofObligations
	 * @param proofObligation
	 * @param level
	 * @param predecessor
	 * @param preCondition
	 */
	private void addProofObligation(final Deque<ProofObligation> proofObligations,
			final ProofObligation proofObligation, final int level, final IcfgLocation predecessor,
			final IPredicate preCondition) {
		// add proof obligation
		final ProofObligation newProofObligation = new ProofObligation(preCondition, predecessor, mLevel - level + 1);

		// mProofObligations.addFirst(newProofObligation);
		proofObligations.addFirst(proofObligation);
		proofObligations.addFirst(newProofObligation);
		if (mLogger.isDebugEnabled()) {
			mLogger.debug("New PO: " + newProofObligation);
		}
	}

	/**
	 * Update location's frame at level by toBoBlocked
	 *
	 * @param toBeBlocked
	 * @param location
	 * @param level
	 */
	private void updateLocalFrames(final IPredicate toBeBlocked, final IcfgLocation location, final int level,
			Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames) {
		for (int i = 0; i <= level; i++) {
			IPredicate fTerm = localFrames.get(location).get(i).getSecond();
			final IPredicate negToBeBlocked = not(toBeBlocked);
			fTerm = mPredicateUnifier.getPredicateFactory().and(fTerm, negToBeBlocked);
			fTerm = mPredicateUnifier.getOrConstructPredicate(fTerm);
			localFrames.get(location).set(i, new Pair<>(ChangedFrame.C, fTerm));
		}
		if (mLogger.isDebugEnabled()) {
			mLogger.debug("LOCAL Frames: Updated \n");
			for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> entry : localFrames.entrySet()) {
				mLogger.debug("  " + entry.getKey().getDebugIdentifier() + ": " + entry.getValue().stream()
						.map(Pair<ChangedFrame, IPredicate>::toString).collect(Collectors.joining(",")));
			}
		}
	}

	/**
	 * Compute conjunction of global frames and the given local frames
	 * 
	 * @param localFrames
	 * @param localLevel
	 */
	final void updateGlobalFrames(final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames,
			final int localLevel) {
		int cnt;
		/*
		 * If local level is bigger than the global level, there are more predicates in local level, we fill the global
		 * frames with true preds.
		 */
		if (localLevel > mLevel) {
			for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> frame : mGlobalFrames.entrySet()) {
				cnt = localLevel - mLevel;
				while (cnt > 0) {
					frame.getValue().add(new Pair<>(ChangedFrame.U, mAxioms));
					cnt--;
				}
			}
		}
		for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> frame : localFrames.entrySet()) {
			for (int i = 0; i <= localLevel; i++) {
				final IPredicate current = frame.getValue().get(i).getSecond();
				final IPredicate changed = mGlobalFrames.get(frame.getKey()).get(i).getSecond();
				final IPredicate conjunct =
						mPredicateUnifier.getOrConstructPredicateForConjunction(Arrays.asList(current, changed));
				mGlobalFrames.get(frame.getKey()).set(i, new Pair<>(frame.getValue().get(i).getFirst(), conjunct));
				// frame.getValue().set(i, new Pair<>(frame.getValue().get(i).getFirst(), conjunct));
			}
		}

		mLevel = localLevel;
		if (mLogger.isDebugEnabled()) {
			mLogger.debug("GLOBAL Frames: Updated \n");
			for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> entry : mGlobalFrames.entrySet()) {
				mLogger.debug("  " + entry.getKey().getDebugIdentifier() + ": " + entry.getValue().stream()
						.map(Pair<ChangedFrame, IPredicate>::toString).collect(Collectors.joining(",")));
			}
		}
	}

	final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> initializeFrames(IIcfg<? extends IcfgLocation> icfg) {
		final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames =
				new HashMap<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>>();
		final Set<? extends IcfgLocation> init = icfg.getInitialNodes();
		final Set<? extends IcfgLocation> error = IcfgUtils.getErrorLocations(mPpIcfg);
		final IcfgLocationIterator<? extends IcfgLocation> iter = new IcfgLocationIterator<>(icfg);
		while (iter.hasNext()) {
			final IcfgLocation loc = iter.next();
			if (error.contains(loc)) {
				continue;
			}
			localFrames.put(loc, new ArrayList<>());

			/*
			 * Assume we only have one errorstate.
			 */
			if (init.contains(loc)) {
				// for (final IcfgLocation errorloc : error) {
				// not used anymore, each initial node needs to be true.
				// if (errorloc.getProcedure().equals(loc.getProcedure())) {
				// localFrames.get(loc).add(new Pair<>(ChangedFrame.U, mAxioms));
				// } else {
				// localFrames.get(loc).add(new Pair<>(ChangedFrame.U, mFalsePred));
				// }
				localFrames.get(loc).add(new Pair<>(ChangedFrame.U, mAxioms));
				// }
			} else {
				localFrames.get(loc).add(new Pair<>(ChangedFrame.U, mFalsePred));
			}
		}
		return localFrames;
	}

	/**
	 * Get a trace of a procedure
	 *
	 * @param callLoc
	 * @param returnTrans
	 * @param globalVarsAssignments
	 * @param oldVarAssignments
	 * @param modifiableGlobals
	 * @return The trace as a pair of List of edges and a summarizing {@link UnmodifiableTransFormula}
	 */
	private List<LETTER> getProcedureTrace(final IIcfgReturnTransition<?, ?> returnTrans) {
		final IcfgLocation returnLoc = returnTrans.getSource();
		final IcfgLocation callLoc = returnTrans.getCallerProgramPoint();
		final List<UnmodifiableTransFormula> tfs = new ArrayList<>();
		tfs.add(returnTrans.getTransformula());
		int i = 0;
		int start = -1;
		int end = -1;

		for (final LETTER l : mTrace) {
			if (l.getSource().equals(callLoc.getLabel())) {
				start = i;
			} else if (l.getSource().equals(returnLoc.getLabel())) {
				end = i;
			}
			i++;
		}

		assert start != -1;
		assert end != -1;
		final List<LETTER> procedureTrace = new ArrayList<>(mTrace.subList(start, end));
		return procedureTrace;

	}

	/**
	 * Get a trace of a proecdure
	 *
	 * @param callLoc
	 * @param returnTrans
	 * @param globalVarsAssignments
	 * @param oldVarAssignments
	 * @param modifiableGlobals
	 * @return The trace as a pair of List of edges and a summarizing {@link UnmodifiableTransFormula}
	 */
	private List<LETTER> getSubTrace(final IcfgLocation target) {
		int end = -1;
		int i = 0;
		for (final LETTER l : mTrace) {
			if (l.getSource().equals(target.getLabel())) {
				end = i;
			}
			i++;
		}
		assert end != -1;
		final List<LETTER> subTrace = new ArrayList<>(mTrace.subList(0, end));
		return subTrace;

	}

	/**
	 * Propagation-Phase, for finding invariants
	 */
	private boolean propagationPhase(final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames) {
		mLogger.debug("Begin Propagation Phase: \n");
		for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> locationTrace : localFrames.entrySet()) {
			final List<Pair<ChangedFrame, IPredicate>> frames = locationTrace.getValue();

			for (int i = 0; i < frames.size() - 1; i++) {
				/*
				 * if (frames.get(i).getFirst() == ChangedFrame.UNCHANGED || frames.get(i + 1).getFirst() ==
				 * ChangedFrame.UNCHANGED) { continue; }
				 */
				final IPredicate p1 = frames.get(i).getSecond();
				final IPredicate p2 = frames.get(i + 1).getSecond();

				if (p1.getFormula().equals(p2.getFormula()) && checkFrames(i, localFrames)) {
					mLogger.debug("Spot: " + i);
					mInvarSpot = i;
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Check invariant candidate location i
	 *
	 * @param i
	 * @return
	 */
	private boolean checkFrames(final int i,
			final Map<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> localFrames) {
		for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> locationTrace : localFrames.entrySet()) {
			if (mPpIcfg.getInitialNodes().contains(locationTrace.getKey())) {
				continue;
			}
			final List<Pair<ChangedFrame, IPredicate>> frames = locationTrace.getValue();

			final IPredicate p1 = frames.get(i).getSecond();
			final IPredicate p2 = frames.get(i + 1).getSecond();
			if (p1.getFormula().equals(p2.getFormula())) {
				continue;
			}
			return false;
		}
		return true;
	}

	/**
	 * Use a {@link IHoareTripleChecker} to check for satisfiability of pre &and; tf &and; post
	 *
	 * This method converts the post condition because an {@link IHoareTripleChecker} checks for P &and; S &and; !Q
	 *
	 * @param pre
	 * @param trans
	 * @param post
	 *
	 * @return {@link Validity#VALID} iff the formula is unsat, {@link Validity#INVALID} iff the formula is sat,
	 *         {@link Validity#UNKNOWN} iff the solver was not able to find a solution, and {@link Validity#NOT_CHECKED}
	 *         should not be returned
	 */
	private Validity checkSatInternal(final IPredicate pre, final IInternalAction trans, final IPredicate post) {
		final IPredicate notP = not(post);
		final Validity result = mHtc.checkInternal(pre, trans, notP);

		if (mLogger.isDebugEnabled()) {
			mLogger.debug(String.format(" %s && %s && %s is %s", pre, trans, post,
					result == Validity.VALID ? "unsat" : result == Validity.INVALID ? "sat" : "unknown"));
		}
		assert result != Validity.NOT_CHECKED;
		return result;

	}

	private Validity checkSatCall(final IPredicate pre, final ICallAction trans, final IPredicate post) {
		final IPredicate notP = not(post);
		final Validity result = mHtc.checkCall(pre, trans, notP);

		if (mLogger.isDebugEnabled()) {
			mLogger.debug(String.format(" %s && %s && %s is %s", pre, trans, post,
					result == Validity.VALID ? "unsat" : result == Validity.INVALID ? "sat" : "unknown"));
		}
		assert result != Validity.NOT_CHECKED;
		return result;
	}

	private Validity checkSatReturn(final IPredicate pre, final IPredicate preHier, final IReturnAction trans,
			final IPredicate post) {
		final IPredicate notP = not(post);
		final Validity result = mHtc.checkReturn(pre, preHier, trans, notP);

		if (mLogger.isDebugEnabled()) {
			mLogger.debug(String.format(" %s && %s && %s && %s is %s", pre, preHier, trans, post,
					result == Validity.VALID ? "unsat" : result == Validity.INVALID ? "sat" : "unknown"));
		}
		assert result != Validity.NOT_CHECKED;
		return result;
	}

	private IPredicate not(final IPredicate pred) {
		return mPredicateUnifier.getPredicateFactory().not(pred);
	}

	/**
	 * Compute interpolants of mTrace.
	 *
	 * @return
	 */
	private IPredicate[] computeInterpolants() {
		mLogger.debug("Computing interpolants.");

		final Map<IcfgLocation, IPredicate> traceFrames = new HashMap<>();
		for (final Entry<IcfgLocation, List<Pair<ChangedFrame, IPredicate>>> entry : mGlobalFrames.entrySet()) {
			final IcfgLocation key = entry.getKey();
			final IcfgLocation actualLoc = key.getLabel();
			assert key != actualLoc : "Not a path program loc";
			assert mInvarSpot != -1 : "Invariants";

			final IPredicate pred = entry.getValue().get(mInvarSpot).getSecond();

			final IPredicate old = traceFrames.put(actualLoc, pred);
			assert old == null || old.equals(pred);

		}

		final Iterator<LETTER> traceIt = mTrace.iterator();
		final IPredicate[] interpolants = new IPredicate[mTrace.size() - 1];
		int i = 0;
		while (traceIt.hasNext()) {
			final LETTER l = traceIt.next();
			if (!traceIt.hasNext()) {
				// the last target is always false
				break;
			}

			final IPredicate lPreds = traceFrames.get(l.getTarget());
			assert lPreds != null;
			// final IPredicate lInterpolant =
			// mPredicateUnifier.getOrConstructPredicateForDisjunction(lPreds);
			interpolants[i] = lPreds;
			++i;
		}
		return interpolants;
	}

	/**
	 * Compute a primed version of pred, meaning priming the variables changed by tf.
	 *
	 * @param script
	 * @param pred
	 * @param tf
	 * @param modifiableGlobals
	 * @return
	 */
	private static Term primePredicate(final Script script, final IPredicate pred, final UnmodifiableTransFormula tf,
			final Set<IProgramNonOldVar> modifiableGlobals) {
		// Set of changed vars by tf
		final Set<IProgramVar> assignedVars = tf.getAssignedVars();
		final Map<Term, Term> substitutionMapping = new HashMap<>();
		for (final IProgramVar bv : pred.getVars()) {
			Term constant;
			if (assignedVars.contains(bv)) {
				constant = bv.getPrimedConstant();
			} else {
				constant = bv.getDefaultConstant();
			}
			substitutionMapping.put(bv.getTermVariable(), constant);
		}
		final Substitution priming = new Substitution(script, substitutionMapping);
		final Term result = priming.transform(pred.getFormula());
		return result;
	}

	/**
	 * Conjunct a {@link IPredicate} and a {@link TransFormula}
	 *
	 * @param script
	 * @param precond
	 * @param tf
	 * @param modifiableGlobalsPred
	 * @return
	 */
	private static Term andPredTf(final Script script, final IPredicate precond, final UnmodifiableTransFormula tf,
			final Set<IProgramNonOldVar> modifiableGlobalsPred) {

		final List<Term> conjuncts = new ArrayList<>();
		// add oldvar equalities for precond and tf
		final Set<IProgramNonOldVar> unprimedOldVarEqualities = new HashSet<>();
		final Set<IProgramNonOldVar> primedOldVarEqualities = new HashSet<>();

		findNonModifiablesGlobals(precond.getVars(), modifiableGlobalsPred, Collections.emptySet(),
				unprimedOldVarEqualities, primedOldVarEqualities);
		findNonModifiablesGlobals(tf.getInVars().keySet(), modifiableGlobalsPred, Collections.emptySet(),
				unprimedOldVarEqualities, primedOldVarEqualities);
		for (final IProgramNonOldVar bv : unprimedOldVarEqualities) {
			conjuncts.add(ModifiableGlobalsTable.constructConstantOldVarEquality(bv, false, script));
		}
		for (final IProgramNonOldVar bv : primedOldVarEqualities) {
			conjuncts.add(ModifiableGlobalsTable.constructConstantOldVarEquality(bv, true, script));
		}

		// add precond
		final Term precondRenamed = precond.getClosedFormula();
		assert precondRenamed != null;
		conjuncts.add(precondRenamed);

		// add tf
		final Term tfRenamed = tf.getClosedFormula();
		assert tfRenamed != null;
		conjuncts.add(tfRenamed);
		return SmtUtils.and(script, conjuncts);
	}

	/**
	 * Find all nonOldVars such that they are modifiable, their oldVar is in vars. Put the nonOldVar in
	 * nonModifiableGlobalsPrimed if the corresponding oldVar is in primedRequired.
	 *
	 * @param vars
	 * @param modifiableGlobalsPred
	 * @param primedRequired
	 * @param nonModifiableGlobalsUnprimed
	 * @param nonModifiableGlobalsPrimed
	 */
	private static void findNonModifiablesGlobals(final Set<IProgramVar> vars,
			final Set<IProgramNonOldVar> modifiableGlobalsPred, final Set<IProgramVar> primedRequired,
			final Set<IProgramNonOldVar> nonModifiableGlobalsUnprimed,
			final Set<IProgramNonOldVar> nonModifiableGlobalsPrimed) {
		for (final IProgramVar bv : vars) {
			if (bv instanceof IProgramOldVar) {
				final IProgramNonOldVar nonOldVar = ((IProgramOldVar) bv).getNonOldVar();
				if (modifiableGlobalsPred.contains(nonOldVar)) {
					// var modifiable, do nothing
				} else {
					if (primedRequired.contains(bv)) {
						nonModifiableGlobalsPrimed.add(nonOldVar);
					} else {
						nonModifiableGlobalsUnprimed.add(nonOldVar);
					}
				}
			}
		}
	}

	private IProgramExecution<IIcfgTransition<IcfgLocation>, Term> computeProgramExecution() {
		// TODO: construct a real IProgramExecution using
		// IcfgProgramExecutionBuilder (DD needs to refactor s.t. the
		// class becomes available here).
		if (mIsTraceCorrect == LBool.SAT) {
			return IProgramExecution.emptyExecution(Term.class, IcfgEdge.class);
		}
		return null;
	}

	private static ManagedScript createSolver(final IUltimateServiceProvider services, final CfgSmtToolkit csToolkit)
			throws AssertionError {
		if (USE_ICFGBUILDER_SOLVER) {
			return csToolkit.getManagedScript();
		}
		// TODO: I guess we have to use two solvers to implement everything correctly:
		// one to represent the predicates
		// we extract and one to perform the actual checks
		final SolverSettings solverSettings =
				SolverBuilder.constructSolverSettings(SolverMode.Internal_SMTInterpol, false, null);
		final Script script = SolverBuilder.buildAndInitializeSolver(services, SolverMode.Internal_SMTInterpol,
				solverSettings, false, false, Logics.ALL, "PdrSolver");

		csToolkit.getSmtFunctionsAndAxioms().transferSymbols(script);
		return new ManagedScript(services, script);
	}

	/** ITraceCheck interface **/

	@Override
	public LBool isCorrect() {
		return mIsTraceCorrect;
	}

	@Override
	public IPredicate getPrecondition() {
		return mTruePred;
	}

	@Override
	public IPredicate getPostcondition() {
		return mFalsePred;
	}

	@Override
	public Map<Integer, IPredicate> getPendingContexts() {
		return Collections.emptyMap();
	}

	@Override
	public boolean providesRcfgProgramExecution() {
		return mIsTraceCorrect != LBool.SAT;
	}

	@Override
	public IProgramExecution<IIcfgTransition<IcfgLocation>, Term> getRcfgProgramExecution() {
		if (mFeasibleProgramExecution == null) {
			mFeasibleProgramExecution = computeProgramExecution();
		}
		return mFeasibleProgramExecution;
	}

	@Override
	public IStatisticsDataProvider getStatistics() {
		return mPdrBenchmark;
	}

	@Override
	public ToolchainCanceledException getToolchainCanceledExpection() {
		return mToolchainCanceledException;
	}

	@Override
	public TraceCheckReasonUnknown getTraceCheckReasonUnknown() {
		return mReasonUnknown;
	}

	@Override
	public boolean wasTracecheckFinishedNormally() {
		return mTraceCheckFinishedNormally;
	}

	/** End ITraceCheck interface **/

	/** IInterpolantGenerator interface **/

	@Override
	public List<LETTER> getTrace() {
		return mTrace;
	}

	@Override
	public IPredicate[] getInterpolants() {
		return mInterpolants;
	}

	@Override
	public IPredicateUnifier getPredicateUnifier() {
		return mPredicateUnifier;
	}

	@Override
	public boolean isPerfectSequence() {
		// if we analyze path programs, each of our sequences is correct
		return isCorrect() == LBool.UNSAT;
	}

	@Override
	public InterpolantComputationStatus getInterpolantComputationStatus() {
		if (isCorrect() == LBool.UNSAT) {
			return new InterpolantComputationStatus(true, null, null);
		} else if (isCorrect() == LBool.SAT) {
			return new InterpolantComputationStatus(false, ItpErrorStatus.TRACE_FEASIBLE, null);
		} else {
			throw new UnsupportedOperationException();
		}
	}

	/** End IInterpolantGenerator interface **/

}
