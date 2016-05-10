/*
 * Copyright (C) 2013-2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 Jeremi Dzienian
 * Copyright (C) 2015 University of Freiburg
 * Copyright (C) 2015 Vincent Langenfeld (langenfv@informatik.uni-freiburg.de)
 * 
 * This file is part of the ULTIMATE Cookiefy plug-in.
 * 
 * The ULTIMATE Cookiefy plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE Cookiefy plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Cookiefy plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Cookiefy plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE Cookiefy plug-in grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.cookiefy;

import de.uni_freiburg.informatik.ultimate.boogie.ast.BooleanLiteral;
import de.uni_freiburg.informatik.ultimate.boogie.ast.Expression;
import de.uni_freiburg.informatik.ultimate.boogie.ast.IdentifierExpression;
import de.uni_freiburg.informatik.ultimate.boogie.ast.UnaryExpression;

/**
 * Contains all context path related operations
 * 
 * @author Jeremi
 * @author Vincent
 * 
 */
public class ContextPath {
	public enum FormulaType {
		Alpha, And, Or, AF, AW, AG
	}

	static public class ContextPathNode {
		private FormulaType m_FormulaType;
		private String m_Path;

		public FormulaType getFormulaType() {
			return this.m_FormulaType;
		}

		public String getPath() {
			return this.m_Path;
		}

		public ContextPathNode(FormulaType type, String path) {
			this.m_FormulaType = type;
			this.m_Path = path;
		}

		/**
		 * returns true, if FormulaType is AG, AF or AW
		 * 
		 * @return
		 */
		public boolean isTemporal() {
			if (this.m_FormulaType == FormulaType.AF)
				return true;
			if (this.m_FormulaType == FormulaType.AG)
				return true;
			if (this.m_FormulaType == FormulaType.AW)
				return true;
			return false;
		}

		public boolean isAtom() {
			if (this.m_FormulaType == FormulaType.Alpha)
				return true;
			return false;
		}
		
		@Override
		public String toString() {
			return getPath();
		}
	}

	static public class ContextPathAlphaNode extends ContextPathNode {
		private Expression m_Expression;

		public Expression getExpression() {
			return this.m_Expression;
		}

		public ContextPathAlphaNode(String path, Expression content) {
			super(FormulaType.Alpha, path);
			this.m_Expression = content;
		}
	}

	// TODO: write 'Sub'-Function
	// static ContextPathNode[] Sub(...) {
	// }

	static ContextPathNode[] getCollantExampleSubResult() {
		return new ContextPathNode[] {
				new ContextPathNode(FormulaType.AG, "T"),
				new ContextPathNode(FormulaType.Or, "TL"),
				new ContextPathAlphaNode("TLL", new UnaryExpression(
						LocationProvider.getLocation(),
						UnaryExpression.Operator.LOGICNEG,
						new IdentifierExpression(
								LocationProvider.getLocation(), "warn"))),
				new ContextPathNode(FormulaType.AW, "TLR"),
				new ContextPathAlphaNode("TLRL", new IdentifierExpression(
						LocationProvider.getLocation(), "warn")),
				new ContextPathNode(FormulaType.And, "TLRR"),
				new ContextPathAlphaNode("TLRLL", new UnaryExpression(
						LocationProvider.getLocation(),
						UnaryExpression.Operator.LOGICNEG,
						new IdentifierExpression(
								LocationProvider.getLocation(), "warn"))),
				new ContextPathNode(FormulaType.AG, "TLRRR"),
				new ContextPathAlphaNode("TLRRRL", new IdentifierExpression(
						LocationProvider.getLocation(), "mad")) };
	}

	static ContextPathNode[] getExampleSubResult() {
		return new ContextPathNode[] {
				new ContextPathNode(FormulaType.AG, "T"),
				new ContextPathNode(FormulaType.Or, "TL"),
				new ContextPathAlphaNode("TLL", new BooleanLiteral(
						LocationProvider.getLocation(), true)),
				new ContextPathNode(FormulaType.AW, "TLR"),
				new ContextPathAlphaNode("TLRL", new BooleanLiteral(
						LocationProvider.getLocation(), false)),
				new ContextPathAlphaNode("TLRR", new BooleanLiteral(
						LocationProvider.getLocation(), false)) };
	}

	static ContextPathNode[] getExampleSubResult2() {
		return new ContextPathNode[] {
				new ContextPathNode(FormulaType.AG, "T"),
				new ContextPathAlphaNode("TL", new BooleanLiteral(
						LocationProvider.getLocation(), true)) };
	}

	static ContextPathNode[] getAGNotFoo() {
		return new ContextPathNode[] {
				new ContextPathNode(FormulaType.AG, "T"),
				new ContextPathAlphaNode("TL", new UnaryExpression(
						LocationProvider.getLocation(),
						UnaryExpression.Operator.LOGICNEG,
						new IdentifierExpression(
								LocationProvider.getLocation(), "foo"))) };
	}
}
