package de.uni_freiburg.informatik.ultimate.PEATestTransformer.Transformer;

import java.util.ArrayList;
import java.util.List;

import de.uni_freiburg.informatik.ultimate.PEATestTransformer.BoogieAstSnippet;
import de.uni_freiburg.informatik.ultimate.PEATestTransformer.SystemInformation;
import de.uni_freiburg.informatik.ultimate.boogie.ast.BinaryExpression;
import de.uni_freiburg.informatik.ultimate.boogie.ast.BinaryExpression.Operator;
import de.uni_freiburg.informatik.ultimate.boogie.output.BoogiePrettyPrinter;
import de.uni_freiburg.informatik.ultimate.boogie.ast.Expression;
import de.uni_freiburg.informatik.ultimate.boogie.ast.IdentifierExpression;
import de.uni_freiburg.informatik.ultimate.boogie.ast.UnaryExpression;
import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import pea.BoogieBooleanExpressionDecision;
import pea.CDD;
import pea.CounterTrace;
import pea.CounterTrace.DCPhase;
import pea.Decision;
import pea.Phase;
import pea.PhaseEventAutomata;
import pea.PhaseSet;
import pea.Trace2PEACompiler;
import pea.Transition;
import srParse.srParsePattern;
import srParse.pattern.PatternType;

public class DeductionGuardTransromation extends BasicTransformer {
	private SystemInformation sysInfo;
	private ILogger logger;
	private final static String CLOSED_WORLD_PREFIX = "R'_";
	private final static String CLOSED_WORLD_SEPR = "_";
	private final static String READ_GUARD_PREFIX = "L'_";

	public DeductionGuardTransromation(ILogger logger, SystemInformation sysInfo) {
		this.sysInfo = sysInfo;
		this.logger = logger;
	}

	/**
	 * 
	 */
	@Override
	protected ArrayList<PhaseEventAutomata> postProcess(ArrayList<PatternType> pats,
			ArrayList<CounterTrace> counterTraces, ArrayList<PhaseEventAutomata> peas) {
		// add deduction guard to every edge of the automaton
		this.logger.info("Beginning DeductionGuard transformation.");
		for (int i = 0; i < pats.size(); i++) {
			PhaseEventAutomata pea = peas.get(i);
			CounterTrace counterTrace = counterTraces.get(i);
			// get last active phase of counter trace automaton
			// int lastphase = counterTrace.getPhases().length -3;
			DCPhase lastPhase = counterTrace.getPhases()[counterTrace.getPhases().length - 3];
			for (Phase loc : pea.getPhases()) {
				for (Transition trans : loc.getTransitions()) {
					boolean destinationHasLastPhase = false;
					// build conjunct from phase invariants (invariant - seeps)
					// check if last phase of the allowed prefix of the counter
					// trace is in the phase
					DCPhase[] phases = counterTrace.getPhases();
					PhaseSet activePhases = trans.getDest().getPhaseBits().getPhaseSet(phases);
					CDD targetPhaseConj = CDD.TRUE;
					for (DCPhase phase : activePhases.getPhases()) {
						if (lastPhase == phase) {
							destinationHasLastPhase = true;
						}
						// also build conjunct of phases of the target state to
						// ignore seeping
						targetPhaseConj = targetPhaseConj.and(phase.getInvariant());
					}
					// create guard for edge
					// if the edge targets a state with the last state in the
					// phase, then take the hole invariant including
					// seeping, else make a guard that is without seeping.
					CDD guard = trans.getGuard();
					logger.warn(trans.getDest().getStateInvariant().toString()+ " | isfinal: " + Boolean.toString(destinationHasLastPhase));
					// take the state invariant in the last phase (including
					// seeping invariants)
					if (destinationHasLastPhase) {
						targetPhaseConj = trans.getDest().getStateInvariant();
					}
					// if there is a conjunct that contains only effect variables
					// this must be an implication and has to be encoded differently
					CDD[] dnf = targetPhaseConj.toDNF();
					CDD effectFree = CDD.FALSE;
					boolean isImplication = false;
					for(CDD conjunct: dnf){
						// if both sets are of equal size and the conjunct contains all effect vars (and therefore only effect vars)
						if(conjunct.getIdents().size() == pats.get(i).getEffectVariabels().size() &&
								conjunct.getIdents().containsAll(pats.get(i).getEffectVariabels())){
							isImplication = true;
						} else {
							effectFree = effectFree.or(conjunct);
						}
					}
					if (isImplication){
						guard = guard
								.and(this.dmGuard(pats.get(i),effectFree.negate().toDNF() , 
										destinationHasLastPhase, isImplication, i));
					} else {
						guard = guard
								.and(this.dmGuard(pats.get(i),dnf , destinationHasLastPhase, isImplication, i));
					}
					// if guard does not talk about R_v then add !R_v (invariant
					// does not guarantee v)
					for (String id : pats.get(i).getEffectVariabels()) {
						String dguard = this.CLOSED_WORLD_PREFIX + id + this.CLOSED_WORLD_SEPR + Integer.toString(i);
						if (guard.getIdents().contains(dguard))
							continue;
						if(destinationHasLastPhase && isImplication){
							guard = guard.or(BoogieBooleanExpressionDecision
									.create(BoogieAstSnippet.createIdentifier(dguard+"DF")).negate());
						} else {
							guard = guard.and(BoogieBooleanExpressionDecision
									.create(BoogieAstSnippet.createIdentifier(dguard+"DF")).negate());
						}
					}
					trans.setGuard(guard);
				}
			}
		}
		// TODO: add deduction guard automata
		return peas;
	}

	/**
	 * Recursive method generates guards to incorporate deduction guards into set of peas.
	 * @param ct
	 * The counter trace of the pea
	 * @param invariant
	 * invariant of the next state, in later iterations part of the invariant that is to be encoded.
	 * @param hasLastPhase
	 * @param disjunction
	 * @return
	 */
	private CDD dmGuard(PatternType pattern, CDD[] dnf, boolean hasLastPhase, boolean isImplication, int reqNo) {
		CDD result = CDD.FALSE;
			for (CDD conjunct : dnf) {
				result = result.or(this.dmGuard(pattern, conjunct, hasLastPhase, isImplication, reqNo));
			}
		return result;
	}

	private CDD dmGuard(PatternType pattern, CDD conjunct, boolean hasLastPhase, boolean isImplication, int reqNo) {
			//end of tree, return 
			if (conjunct == CDD.TRUE) {
	            return conjunct;
	        }
	        if (conjunct == CDD.FALSE) {
	            return conjunct;
	        }
	
	        //generate guards from this CDD's decision
	        CDD result = this.dmGuard(pattern, ((BoogieBooleanExpressionDecision)conjunct.getDecision()).getExpression()
	        				, hasLastPhase, isImplication, reqNo, conjunct.getChilds()[0] == CDD.FALSE);
	        // process children
	        CDD newChild = CDD.TRUE;
	        for(CDD child: conjunct.getChilds()){
		    	if (child != CDD.FALSE && child != CDD.TRUE) {
		        	newChild = newChild.and(dmGuard(pattern, child, hasLastPhase, false, reqNo));
		    	}    
		    }
	        if (newChild != CDD.FALSE){
	        	result = result.and(newChild);
	        }
		return result; 
	}

	private CDD dmGuard(PatternType pattern, Expression e, boolean hasLastPhase, boolean isImplication,
			int reqNo, boolean negate) {
		CDD result = BoogieBooleanExpressionDecision.create(e);
		if (negate){
			result = result.negate();
		}
		for(String ident: result.getIdents()){
			// do not encode input vars
			if (this.sysInfo.isInput(ident)){
				continue;
			}
			result = result.and( BoogieBooleanExpressionDecision.create(
					this.encodeIdentifierExpression(pattern, ident, hasLastPhase, isImplication, reqNo)));
		}
		return result;
	}
	
	private Expression encodeIdentifierExpression(PatternType pattern, String ident, boolean hasLastPhase, 
			boolean isImplication, int reqNo) {
		if (hasLastPhase){
			if(pattern.isEffect(ident)){
				return this.encodeEffectVar(ident, reqNo);
			} else {
				return this.encodeInternalVar(ident);
			}
		} else {
			return this.encodeInternalVar(ident);
		}
	}
	
	/**
	 * Encode internal identifiert o be checkt if readable 
	 * e.g. "a" -> "(L'_a && a')"
	 */
	private Expression encodeInternalVar(String ident){
		return new IdentifierExpression(BoogieAstSnippet.createDummyLocation(), this.READ_GUARD_PREFIX + ident);
	}
	
	/**
	 * Encode an effect of a variable as true
	 * e.g. "a" -> "R'_a_reqNo"
	 */
	private Expression encodeEffectVar(String ident, int reqNo){
		return new IdentifierExpression(BoogieAstSnippet.createDummyLocation(), this.CLOSED_WORLD_PREFIX + ident + 
				this.CLOSED_WORLD_SEPR + Integer.toString(reqNo));
	}
	
	
	
	
	
	
	
	

}
