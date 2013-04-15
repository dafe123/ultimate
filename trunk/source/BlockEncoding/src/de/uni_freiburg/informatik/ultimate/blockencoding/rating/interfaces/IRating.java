/**
 * 
 */
package de.uni_freiburg.informatik.ultimate.blockencoding.rating.interfaces;

import de.uni_freiburg.informatik.ultimate.blockencoding.rating.RatingValue;

/**
 * Objects of this kind contains the rating of a certain IMinimizedEdge. Since
 * there are several ways how to rate a edge, there are several classes which
 * implement this interface.
 * 
 * @author Stefan Wissert
 * 
 */
public interface IRating extends Comparable<IRating> {

	/**
	 * Returns the rated value, as a container object. This is needed because
	 * for several ratings there can be several ways to store the values.
	 * 
	 * @return a rating value container
	 */
	public RatingValue<?> getRatingValue();
}
