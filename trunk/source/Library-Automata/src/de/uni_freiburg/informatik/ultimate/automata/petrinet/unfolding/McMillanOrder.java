package de.uni_freiburg.informatik.ultimate.automata.petrinet.unfolding;

/**
 * Naive order used by McMillan.
 * 
 * @author Julian Jarecki (jareckij@informatik.uni-freiburg.de)
 * @author Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * 
 * @param <LETTER>
 *            Type of letters from the alphabet used to label transitions
 * @param <PLACE>
 *            place content type
 */
public class McMillanOrder<LETTER, PLACE> extends EventOrder<LETTER, PLACE> {

	@Override
	public int compare(final IConfiguration<LETTER, PLACE> o1, final IConfiguration<LETTER, PLACE> o2) {
		return o1.size() - o2.size();
	}
	
}
