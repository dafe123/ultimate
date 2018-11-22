/**
 * TODO: Copyright.
 */

package de.uni_freiburg.informatik.ultimate.mso;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.automata.nestedword.operations.minimization.IMinimizationStateFactory;
import de.uni_freiburg.informatik.ultimate.automata.statefactory.IDeterminizeStateFactory;
import de.uni_freiburg.informatik.ultimate.automata.statefactory.IIntersectionStateFactory;
import de.uni_freiburg.informatik.ultimate.automata.statefactory.ISinkStateFactory;

/**
 * Not what we were looking for.
 * 
 * @author Elisabeth Henkel (henkele@informatik.uni-freiburg.de)
 * @author Nico Hauff (hauffn@informatik.uni-freiburg.de)
 */
public class MoNatDiffStringFactory implements IIntersectionStateFactory<String>, ISinkStateFactory<String>,
		IDeterminizeStateFactory<String>, IMinimizationStateFactory<String> {

	static final String EMPTY = "€";
	static final String STATE = "q";
	BigInteger mCounter;

	public MoNatDiffStringFactory() {
		mCounter = BigInteger.ZERO;
	}

	@Override
	public String createEmptyStackState() {
		return EMPTY;
	}

	@Override
	public String intersection(final String state1, final String state2) {
		return newString();
	}

	@Override
	public String createSinkStateContent() {
		return "∅SinkState";
	}

	@Override
	public String determinize(final Map<String, Set<String>> down2up) {
		return newString();
	}

	@Override
	public String merge(final Collection<String> states) {
		return newString();
	}

	/**
	 * TODO: Returns an unique string.
	 */
	private String newString() {
		final StringBuilder builder = new StringBuilder();
		builder.append(STATE).append(mCounter.toString());
		mCounter = mCounter.add(BigInteger.ONE);

		return builder.toString();
	}
}