/**
 * 
 */
package de.uni_freiburg.informatik.ultimate.blockencoding.rating;

import de.uni_freiburg.informatik.ultimate.blockencoding.model.interfaces.IBasicEdge;
import de.uni_freiburg.informatik.ultimate.blockencoding.model.interfaces.ICompositeEdge;
import de.uni_freiburg.informatik.ultimate.blockencoding.model.interfaces.IMinimizedEdge;
import de.uni_freiburg.informatik.ultimate.blockencoding.rating.interfaces.IRating;

/**
 * The default rating, simply counts the number of statements which are inside a
 * specific minimized edge.
 * 
 * @author Stefan Wissert
 * 
 */
public class DefaultRating implements IRating {

	private RatingValue<Integer> countOfStatements;

	/**
	 * Constructor, which is only visible in this package (default visibility)
	 * 
	 * @param edge
	 *            the edge to be rated
	 */
	DefaultRating(IMinimizedEdge edge) {
		// Basic-Edges have exactly one statement
		if (edge instanceof IBasicEdge) {
			countOfStatements = new RatingValue<Integer>(1);
		}
		// For Composite-Edges we summarize the count of statements of the left
		// and the right side
		if (edge instanceof ICompositeEdge) {
			countOfStatements = new RatingValue<Integer>(0);
			ICompositeEdge compEdge = (ICompositeEdge) edge;
			IMinimizedEdge left = compEdge.getCompositeEdges()[0];
			IMinimizedEdge right = compEdge.getCompositeEdges()[1];
			if (!(left.getRating() instanceof DefaultRating)
					|| !(right.getRating() instanceof DefaultRating)) {
				throw new IllegalArgumentException(
						"Rating-Objects should be of the same type!");
			}
			DefaultRating leftRating = (DefaultRating) left.getRating();
			DefaultRating rightRating = (DefaultRating) right.getRating();
			countOfStatements.setValue(leftRating.getRatingValue().getValue()
					+ rightRating.getRatingValue().getValue());
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * de.uni_freiburg.informatik.ultimate.blockencoding.model.interfaces.IRating
	 * #getRatingValue()
	 */
	@Override
	public RatingValue<Integer> getRatingValue() {
		return countOfStatements;
	}

	@Override
	public int compareTo(IRating other) {
		if (!(other instanceof DefaultRating)) {
			throw new IllegalArgumentException(
					"Comparison of different Ratings is forbidden!");
		}
		DefaultRating otherRating = (DefaultRating) other;
		return countOfStatements.getValue().compareTo(
				otherRating.getRatingValue().getValue());
	}

}
