/*
 * Copyright (C) 2012-2015 Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * Copyright (C) 2009-2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE Automata Library.
 * 
 * The ULTIMATE Automata Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE Automata Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Automata Library. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Automata Library, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP),
 * containing parts covered by the terms of the Eclipse Public License, the
 * licensors of the ULTIMATE Automata Library grant you additional permission
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.automata.nestedword.senwa;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.automata.AutomataLibraryException;
import de.uni_freiburg.informatik.ultimate.automata.AutomataLibraryServices;
import de.uni_freiburg.informatik.ultimate.automata.AutomataOperationCanceledException;
import de.uni_freiburg.informatik.ultimate.automata.LibraryIdentifiers;
import de.uni_freiburg.informatik.ultimate.automata.nestedword.DoubleDecker;
import de.uni_freiburg.informatik.ultimate.automata.nestedword.INestedWordAutomaton;
import de.uni_freiburg.informatik.ultimate.automata.nestedword.Senwa;
import de.uni_freiburg.informatik.ultimate.automata.nestedword.transitions.IncomingReturnTransition;
import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;

/**
 * Visit all states of a SENWA. This can also be used to construct this SEVPA.
 * 
 * @author Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * @param <LETTER>
 *            letter type
 * @param <STATE>
 *            state type
 */
public class SenwaWalker<LETTER, STATE> {
	
	private final AutomataLibraryServices mServices;
	private final ILogger mLogger;
	
	protected Senwa<LETTER, STATE> mTraversedSenwa;
	
	/**
	 * STATEs that are already known but have not yet been visited.
	 */
	private final List<STATE> mWorklist = new LinkedList<>();
	
	/**
	 * STATEs that have already been marked. (Which means already visited or in
	 * the worklist.)
	 */
	private final Set<STATE> mMarked = new HashSet<>();
	
	/**
	 * We remove afterwards all dead ends iff set to true.
	 */
	protected boolean mRemoveDeadEnds;
	
	/**
	 * We remove afterwards all non-live states iff set to true.
	 */
	protected boolean mRemoveNonLiveStates = false;
	
	/**
	 * DoubleDeckers that have been constructed but do not occur in any
	 * accepting run of the automaton.
	 */
	private final Map<STATE, Set<STATE>> mRemovedDoubleDeckers =
			new HashMap<>();
			
	/**
	 * DoubleDeckers which occur on an accepting run.
	 */
	protected Set<DoubleDecker<STATE>> mDoubleDeckersThatCanReachFinal;
	protected Map<STATE, STATE> mCallSuccOfRemovedDown;
	
	protected DoubleDecker<STATE> mAauxiliaryEmptyStackDoubleDecker;
	
	protected ISuccessorVisitor<LETTER, STATE> mSuccVisit;
	private long mDeadEndRemovalTime;
	
	/**
	 * Constructor.
	 * 
	 * @param services
	 *            Ultimate services
	 * @param senwa
	 *            SENWA
	 * @param succVisit
	 *            successor visitor
	 * @param removeDeadEnds
	 *            true iff dead ends should be removed
	 * @throws AutomataOperationCanceledException
	 *             if timeout exceeds
	 */
	public SenwaWalker(final AutomataLibraryServices services,
			final Senwa<LETTER, STATE> senwa,
			final ISuccessorVisitor<LETTER, STATE> succVisit,
			final boolean removeDeadEnds) throws AutomataOperationCanceledException {
		mServices = services;
		mLogger = mServices.getLoggingService().getLogger(LibraryIdentifiers.PLUGIN_ID);
		mTraversedSenwa = senwa;
		mSuccVisit = succVisit;
		mRemoveDeadEnds = removeDeadEnds;
		traverseDoubleDeckerGraph();
	}
	
	public INestedWordAutomaton<LETTER, STATE> getResult() throws AutomataLibraryException {
		return mTraversedSenwa;
	}
	
	/**
	 * True iff the STATE state has been marked. A DoubleDecker
	 * is marked iff it has been visited or is in the mWorklist.
	 */
	private final boolean wasMarked(final STATE state) {
		return mMarked.contains(state);
	}
	
	private final void mark(final STATE state) {
		mMarked.add(state);
	}
	
	/**
	 * Add STATE state to worklist if it has not yet been marked.
	 */
	private final void enqueueAndMark(final STATE state) {
		assert mTraversedSenwa.getStates().contains(state);
		if (!wasMarked(state)) {
			mark(state);
			mWorklist.add(state);
		}
	}
	
//	/**
//	 * Record that summarySucc is reachable from summaryPred via a run over a
//	 * well-matched NestedWord.
//	 */
//	private final void addSummary(STATE summaryPred,
//							STATE summarySucc, STATE returnPred) {
//		Map<STATE,STATE> summarySuccessors =
//			mCallReturnSummary.get(summaryPred);
//		if (summarySuccessors == null) {
//			summarySuccessors = new HashMap<STATE,STATE>();
//			mCallReturnSummary.put(summaryPred, summarySuccessors);
//		}
//		summarySuccessors.put(summarySucc, returnPred);
//		enqueueSummarySuccs(summaryPred, summarySucc, returnPred);
//	}

//	/**
//	 * For all DoubleDeckers (<i>down</i>,summaryPred) that have been marked
//	 * enqueue and mark the DoubleDecker (<i>down</i>,summarySucc) and record
//	 * that the DoubleDecker (summaryPred,returnPred) is a predecessor of
//	 * (<i>down</i>,summarySucc).
//	 */
//	private final void enqueueSummarySuccs(STATE summaryPred,
//			STATE summarySucc, STATE returnPred) {
//		for (STATE summaryPreDown : mMarked_Up2Down.get(summaryPred)) {
//			DoubleDecker<STATE> doubleDecker =
//				new DoubleDecker<STATE>(summaryPreDown, summaryPred);
//			DoubleDecker<STATE> summarySuccDoubleDecker =
//				new DoubleDecker<STATE>(summaryPreDown, summarySucc);
//			DoubleDecker<STATE> summaryReturnPred =
//				new DoubleDecker<STATE>(summaryPred, returnPred);
//			memorizePredecessor(summarySuccDoubleDecker, summaryReturnPred, mReturnPredecessors);
//			memorizePredecessor(summarySuccDoubleDecker, doubleDecker, mSummaryPredecessors);
//			enqueueAndMark(summarySuccDoubleDecker);
//		}
//	}
//
//
//
//	/**
//	 * Get all states <i>down</i> such that the DoubleDecker
//	 * (<i>down</i>,<i>up</i>) has been visited so far.
//	 */
//	private final Set<STATE> getKnownDownStates(STATE up) {
//		Set<STATE> downStates = mMarked_Up2Down.get(up);
//		if (downStates == null) {
//			return new HashSet<STATE>(0);
//		}
//		else {
//			return downStates;
//		}
//	}
//
//	/**
//	 * Get all states <i>up</i> such that the DoubleDecker
//	 * (<i>down</i>,<i>up</i>) has been visited so far.
//	 */
//	private final Set<STATE> getKnownUpStates(STATE up) {
//		if (mMarked_Down2Up == null) {
//			throw new UnsupportedOperationException("Up states not computeted");
//		}
//		Set<STATE> upStates = mMarked_Down2Up.get(up);
//		if (upStates == null) {
//			return new HashSet<STATE>(0);
//		}
//		else {
//			return upStates;
//		}
//	}
	
	protected final void traverseDoubleDeckerGraph()
			throws AutomataOperationCanceledException {
		final Iterable<STATE> initialStates = mSuccVisit.getInitialStates();
		for (final STATE state : initialStates) {
			enqueueAndMark(state);
		}
		
		while (!mWorklist.isEmpty()) {
			final STATE state = mWorklist.remove(0);
			assert mTraversedSenwa.getStates().contains(state);
			
			final Iterable<STATE> internalSuccs = mSuccVisit.visitAndGetInternalSuccessors(state);
			for (final STATE succ : internalSuccs) {
				enqueueAndMark(succ);
			}
			final Iterable<STATE> callSuccs = mSuccVisit.visitAndGetCallSuccessors(state);
			for (final STATE succ : callSuccs) {
				enqueueAndMark(succ);
				assert (succ == mTraversedSenwa.getEntry(succ) || mTraversedSenwa.getEntry(succ) == null);
				final ArrayList<STATE> moduleStates = new ArrayList<STATE>();
				moduleStates.addAll(mTraversedSenwa.getModuleStates(succ));
				for (final STATE moduleState : moduleStates) {
					final Iterable<STATE> returnSuccs =
							mSuccVisit.visitAndGetReturnSuccessors(moduleState, state);
					for (final STATE retSucc : returnSuccs) {
						enqueueAndMark(retSucc);
					}
					
				}
				assert mTraversedSenwa.getCallPredecessors(succ).contains(state);
			}
			
			final STATE entry = mTraversedSenwa.getEntry(state);
			for (final LETTER call : mTraversedSenwa.lettersCallIncoming(entry)) {
				for (final STATE hier : mTraversedSenwa.predCall(entry, call)) {
					final Iterable<STATE> returnSuccs =
							mSuccVisit.visitAndGetReturnSuccessors(state, hier);
					for (final STATE retSucc : returnSuccs) {
						enqueueAndMark(retSucc);
					}
				}
			}
			
			if (!mServices.getProgressMonitorService().continueProcessing()) {
				throw new AutomataOperationCanceledException(this.getClass());
			}
			
		}
		mLogger.info("Result " + mTraversedSenwa.sizeInformation());
		if (mRemoveDeadEnds && mRemoveNonLiveStates) {
			throw new IllegalArgumentException("RemoveDeadEnds and RemoveNonLiveStates is set");
		}
		
		if (mRemoveDeadEnds) {
//			new TestFileWriter(mTraversedNwa, "TheAutomaotn", TestFileWriter.Labeling.TOSTRING);
			removeStatesThatCanNotReachFinal(false);
			if (mTraversedSenwa.getInitialStates().isEmpty()) {
				assert mTraversedSenwa.getStates().isEmpty();
				mTraversedSenwa = getTotalizedEmptyAutomaton();
			}
			mLogger.info("After removal of dead ends " + mTraversedSenwa.sizeInformation());
			
		}
		if (mRemoveNonLiveStates) {
//			mLogger.warn("Minimize before non-live removal: " +
//		((NestedWordAutomaton<LETTER,STATE>)
//			(new MinimizeDfa<LETTER, STATE>(mTraversedNwa)).getResult()).sizeInformation());
			removeNonLiveStates();
//			mLogger.warn("Minimize after non-live removal: " +
//		((NestedWordAutomaton<LETTER,STATE>)
//			(new MinimizeDfa<LETTER, STATE>(mTraversedNwa)).getResult()).sizeInformation());
			if (mTraversedSenwa.getInitialStates().isEmpty()) {
				assert mTraversedSenwa.getStates().isEmpty();
//				mTraversedSenwa = getTotalizedEmptyAutomaton();
			}
			mLogger.info("After removal of nonLiveStates " + mTraversedSenwa.sizeInformation());
		}
		
	}
	
	protected Senwa<LETTER, STATE> getTotalizedEmptyAutomaton() {
		final Senwa<LETTER, STATE> emptyAutomaton = new Senwa<LETTER, STATE>(
				mServices,
				mTraversedSenwa.getInternalAlphabet(),
				mTraversedSenwa.getCallAlphabet(),
				mTraversedSenwa.getReturnAlphabet(),
				mTraversedSenwa.getStateFactory());
		final STATE sinkState = emptyAutomaton.getStateFactory().createSinkStateContent();
		emptyAutomaton.addState(sinkState, true, false, sinkState);
		
		for (final STATE state : emptyAutomaton.getStates()) {
			for (final LETTER letter : emptyAutomaton.getInternalAlphabet()) {
				if (emptyAutomaton.succInternal(state, letter).isEmpty()) {
					emptyAutomaton.addInternalTransition(state, letter, sinkState);
				}
			}
			for (final LETTER letter : emptyAutomaton.getCallAlphabet()) {
				if (emptyAutomaton.succCall(state, letter).isEmpty()) {
					emptyAutomaton.addCallTransition(state, letter, sinkState);
				}
			}
			for (final LETTER symbol : emptyAutomaton.getReturnAlphabet()) {
				for (final STATE hier : emptyAutomaton.getStates()) {
					if (emptyAutomaton.succReturn(state, hier, symbol).isEmpty()) {
						emptyAutomaton.addReturnTransition(state, hier, symbol, sinkState);
					}
				}
			}
		}
		
		return emptyAutomaton;
	}
	
	private final Set<STATE> computeStatesThatCanNotReachFinal() {
		
		// Set used to compute the states that can never reach the final state
		// initialized with all states and narrowed by the algorithm
		final Set<STATE> statesNeverReachFinal = new HashSet<STATE>(mTraversedSenwa.getStates());
		
//		Set<DoubleDecker<STATE>> acceptingDoubleDeckers = new HashSet<DoubleDecker<STATE>>();
//		for (STATE finalState : mTraversedSenwa.getFinalStates()) {
//			Set<STATE> finalsDownStates = mMarked_Up2Down.get(finalState);
//			for (STATE downStatesOfFinal : finalsDownStates) {
//				DoubleDecker<STATE> summary =	new DoubleDecker<STATE>(downStatesOfFinal, finalState);
//				acceptingDoubleDeckers.add(summary);
//			}
//		}
		
		LinkedList<STATE> ancestorSearchWorklist;
		
		//Computation of nonReturnAncestors
		ancestorSearchWorklist = new LinkedList<STATE>();
		for (final STATE state : mTraversedSenwa.getFinalStates()) {
			statesNeverReachFinal.remove(state);
		}
		ancestorSearchWorklist.addAll(mTraversedSenwa.getFinalStates());
		while (!ancestorSearchWorklist.isEmpty()) {
			final STATE state = ancestorSearchWorklist.removeFirst();
			statesNeverReachFinal.remove(state);
			for (final LETTER letter : mTraversedSenwa.lettersInternalIncoming(state)) {
				for (final STATE pred : mTraversedSenwa.predInternal(state, letter)) {
					final boolean wasContained = statesNeverReachFinal.remove(pred);
					if (wasContained) {
						ancestorSearchWorklist.add(pred);
					}
				}
			}
			for (final LETTER letter : mTraversedSenwa.lettersCallIncoming(state)) {
				for (final STATE pred : mTraversedSenwa.predCall(state, letter)) {
					final boolean wasContained = statesNeverReachFinal.remove(pred);
					if (wasContained) {
						ancestorSearchWorklist.add(pred);
					}
				}
			}
			for (final IncomingReturnTransition<LETTER, STATE> inTrans : mTraversedSenwa.returnPredecessors(state)) {
				final STATE pred = inTrans.getLinPred();
				final boolean wasContained = statesNeverReachFinal.remove(pred);
				if (wasContained) {
					ancestorSearchWorklist.add(pred);
				}
			}
		}
		return statesNeverReachFinal;
	}
	
	/**
	 * Remove in the resulting automaton all states that can not reach a final
	 * state.
	 * 
	 * @param computeRemovedDoubleDeckersAndCallSuccessors
	 *            compute the set of
	 *            all DoubleDeckers which occurred in the build automaton but are not
	 *            reachable after the removal
	 * @return true iff at least one state was removed.
	 */
	public final boolean removeStatesThatCanNotReachFinal(
			final boolean computeRemovedDoubleDeckersAndCallSuccessors) {
		final long startTime = System.currentTimeMillis();
		final Set<STATE> statesNeverReachFinal = computeStatesThatCanNotReachFinal();
		if (computeRemovedDoubleDeckersAndCallSuccessors) {
			announceRemovalOfDoubleDeckers(statesNeverReachFinal);
		}
		
//		//some states are not removed but loose inital property
//		Set<STATE> statesThatShouldNotBeInitialAnyMore = new HashSet<STATE>();
//		for (STATE state : mTraversedSenwa.getInitialStates()) {
//			if (statesNeverReachFinal.contains(state)) {
//				continue;
//			}
//			DoubleDecker<STATE> dd = new DoubleDecker<STATE>(mTraversedSenwa.getEmptyStackState(), state);
//			if (doubleDeckersThatCanReachFinal.contains(dd)) {
//				continue;
//			}
//			statesThatShouldNotBeInitialAnyMore.add(state);
//		}
//		for (STATE state : statesThatShouldNotBeInitialAnyMore) {
//			mTraversedSenwa.makeStateNonIntial(state);
//			mLogger.warn("The following state is not final any more: " +state);
//		}
		
		// remove states which can not reach final, but postpone removal of
		// entrys and remove them at last.
		final Collection<STATE> entrysNeverReachFinal = new ArrayList<STATE>();
		for (final STATE state : statesNeverReachFinal) {
			if (mTraversedSenwa.isEntry(state)) {
				entrysNeverReachFinal.add(state);
			} else {
				mTraversedSenwa.removeState(state);
			}
		}
		for (final STATE state : entrysNeverReachFinal) {
			mTraversedSenwa.removeState(state);
		}
		
		final boolean atLeastOneStateRemoved = !statesNeverReachFinal.isEmpty();
		mDeadEndRemovalTime += (System.currentTimeMillis() - startTime);
		return atLeastOneStateRemoved;
	}
	
	/**
	 * Announce removal of all DoubleDeckers (<i>down</i>,<i>up</i>) such that
	 * <i>down</i> or <i>up</i> is contained in statesGoingToBeRemoved.
	 */
	// _before_ because on removal we want to be able to access all states
	// of the automaton
	private void announceRemovalOfDoubleDeckers(final Set<STATE> statesGoingToBeRemoved) {
		mCallSuccOfRemovedDown = new HashMap<STATE, STATE>();
		
		/**
		 * DoubleDeckers that have been constructed but do not occur in any
		 * accepting run of the automaton.
		 */
		for (final STATE up : statesGoingToBeRemoved) {
			final STATE entry = mTraversedSenwa.getEntry(up);
			for (final STATE down : mTraversedSenwa.getCallPredecessors(entry)) {
				Set<STATE> downStates = mRemovedDoubleDeckers.get(up);
				if (downStates == null) {
					downStates = new HashSet<STATE>();
					mRemovedDoubleDeckers.put(up, downStates);
				}
				downStates.add(down);
				
				final Set<STATE> downCallSuccs = computeState2CallSuccs(down);
				if (downCallSuccs.size() > 1) {
					throw new UnsupportedOperationException(
							"If state has several outgoing call transitions Hoare annotation might be incorrect.");
				} else if (downCallSuccs.size() == 1) {
					final STATE callSucc = downCallSuccs.iterator().next();
					mCallSuccOfRemovedDown.put(down, callSucc);
				} else {
					assert downCallSuccs.isEmpty();
				}
			}
		}
	}
	
	/**
	 * Compute call successors for a given set of states.
	 */
	private Set<STATE> computeState2CallSuccs(final STATE state) {
		final Set<STATE> callSuccs = new HashSet<STATE>();
		if (state != mTraversedSenwa.getEmptyStackState()) {
			for (final LETTER letter : mTraversedSenwa.lettersCall(state)) {
				callSuccs.addAll(mTraversedSenwa.succCall(state, letter));
			}
		}
		return callSuccs;
	}
	
	/**
	 * @return true iff state has successors.
	 */
	private boolean hasSuccessors(final STATE state) {
		for (final LETTER symbol : mTraversedSenwa.lettersInternal(state)) {
			if (!mTraversedSenwa.succInternal(state, symbol).isEmpty()) {
				return true;
			}
		}
		for (final LETTER symbol : mTraversedSenwa.lettersCall(state)) {
			if (!mTraversedSenwa.succCall(state, symbol).isEmpty()) {
				return true;
			}
		}
		for (final LETTER symbol : mTraversedSenwa.lettersReturn(state)) {
			for (final STATE hier : mTraversedSenwa.hierarchicalPredecessorsOutgoing(state, symbol)) {
				if (!mTraversedSenwa.succReturn(state, hier, symbol).isEmpty()) {
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * Remove all state that are accepting and do not have any successor.
	 * 
	 * @return true iff some state was removed
	 */
	private final boolean removeAcceptingStatesWithoutSuccessors() {
		
		final ArrayList<STATE> finalStatesWithoutSuccessor = new ArrayList<STATE>();
		for (final STATE accepting : mTraversedSenwa.getFinalStates()) {
			if (!hasSuccessors(accepting)) {
				finalStatesWithoutSuccessor.add(accepting);
			}
		}
		final boolean atLeastOneStateRemoved = !finalStatesWithoutSuccessor.isEmpty();
		for (final STATE finalStateWithoutSuccessor : finalStatesWithoutSuccessor) {
			mTraversedSenwa.removeState(finalStateWithoutSuccessor);
		}
		return atLeastOneStateRemoved;
	}
	
	/**
	 * Remove all states from which only finitely many accepting states are
	 * reachable.
	 */
	private final void removeNonLiveStates() {
		boolean stateRemovedInInteration;
		do {
			stateRemovedInInteration = removeStatesThatCanNotReachFinal(false);
			stateRemovedInInteration |= removeAcceptingStatesWithoutSuccessors();
		} while (stateRemovedInInteration);
	}
	
	public Map<STATE, STATE> getCallSuccOfRemovedDown() {
		if (mCallSuccOfRemovedDown == null || mRemovedDoubleDeckers == null) {
			throw new AssertionError("Request computation when removing");
		}
		return mCallSuccOfRemovedDown;
	}
	
	public Map<STATE, Set<STATE>> getRemovedDoubleDeckers() {
		if (mCallSuccOfRemovedDown == null || mRemovedDoubleDeckers == null) {
			throw new AssertionError("Request computation when removing");
		}
		return mRemovedDoubleDeckers;
	}
	
	public interface ISuccessorVisitor<LETTER, STATE> {
		/**
		 * @return Initial states of automaton.
		 */
		Iterable<STATE> getInitialStates();
		
		/**
		 * @param state
		 *            state
		 * @return internal successors of doubleDeckers up state
		 */
		Iterable<STATE> visitAndGetInternalSuccessors(STATE state);
		
		/**
		 * @param state
		 *            state
		 * @return call successors of doubleDeckers up state
		 */
		Iterable<STATE> visitAndGetCallSuccessors(STATE state);
		
		/**
		 * @param state
		 *            linear predecessor state
		 * @param hier
		 *            hierarchical predecessor state
		 * @return return successors of doubleDeckers up state
		 */
		Iterable<STATE> visitAndGetReturnSuccessors(STATE state, STATE hier);
	}
	
	public long getDeadEndRemovalTime() {
		return mDeadEndRemovalTime;
	}
}
