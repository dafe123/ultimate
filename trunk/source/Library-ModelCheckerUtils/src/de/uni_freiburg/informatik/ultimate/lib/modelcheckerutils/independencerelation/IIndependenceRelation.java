/*
 * Copyright (C) 2019 Dominik Klumpp (klumpp@informatik.uni-freiburg.de)
 * Copyright (C) 2019 University of Freiburg
 *
 * This file is part of the ULTIMATE ModelCheckerUtils Library.
 *
 * The ULTIMATE ModelCheckerUtils Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * The ULTIMATE ModelCheckerUtils Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE ModelCheckerUtils Library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE ModelCheckerUtils Library, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP),
 * containing parts covered by the terms of the Eclipse Public License, the
 * licensors of the ULTIMATE ModelCheckerUtils Library grant you additional permission
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.lib.modelcheckerutils.independencerelation;

/**
 * An independence relation that is used in Partial Order or Lipton reductions.
 *
 * @author Dominik Klumpp (klumpp@informatik.uni-freiburg.de)
 * 
 * @param <STATE>
 *            The type of states the independence may depend on.
 * @param <LETTER>
 *            The type of letters whose independence is defined by the relation.
 */
public interface IIndependenceRelation<STATE, LETTER> {
	/**
	 * Indicates whether this relation is symmetric (i.e., captures full
	 * commutativity) or not (i.e., captures semicommutativity, Lipton movers).
	 */
	boolean isSymmetric();

	/**
	 * Indicates whether this relation is conditional, i.e., the result of
	 * {@link contains} may differ depending on the given states.
	 */
	boolean isConditional();

	/**
	 * Tests if the given pair of actions is in the relation for the given state.
	 * Undetermined checks should return {@code false} to remain conservative.
	 * Unconditional relations (see {@link isConditional}) should accept
	 * {@code null} as state.
	 *
	 * The intuition is that a word containing the subsequence "ba" *covers*
	 * the corresponding word where the subsequence was replaced by "ab",
	 * e.g. infeasibility of the former implies infeasibility of the latter.
	 * We also sometimes say that {@code a} is a right-mover for {@code b} (in the given
	 * {@code state}, if the relation is conditional), or resp., {@code b} is a left
	 * mover for {@code a}.
	 */
	boolean contains(STATE state, LETTER a, LETTER b);
}
