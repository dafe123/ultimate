/*
 * Copyright (C) 2016 Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * Copyright (C) 2016 University of Freiburg
 * 
 * This file is part of the ULTIMATE ModelCheckerUtilsTest Library.
 * 
 * The ULTIMATE ModelCheckerUtilsTest Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE ModelCheckerUtilsTest Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE ModelCheckerUtilsTest Library. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE ModelCheckerUtilsTest Library, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE ModelCheckerUtilsTest Library grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;

import de.uni_freiburg.informatik.ultimate.core.coreplugin.services.ToolchainStorage;
import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import de.uni_freiburg.informatik.ultimate.core.model.services.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.logic.Logics;
import de.uni_freiburg.informatik.ultimate.logic.Script;
import de.uni_freiburg.informatik.ultimate.logic.Sort;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.SmtUtils.SimplificationTechnique;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.SmtUtils.XnfConversionTechnique;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.managedscript.ManagedScript;
import de.uni_freiburg.informatik.ultimate.smtsolver.external.Scriptor;
import de.uni_freiburg.informatik.ultimate.test.mocks.UltimateServiceProviderMock;


/**
 * 
 * @author Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 *
 */
public class QuantifierEliminationTest {
	
	private IUltimateServiceProvider mServices;
	private Script script;
	private ManagedScript mMgdScript;
	private ILogger mLogger;
	
	@Before
	public void setUp(){
		mServices = new UltimateServiceProviderMock();
		mLogger = mServices.getLoggingService().getLogger("lol");
		try {
			script = new Scriptor("z3 SMTLIB2_COMPLIANT=true -memory:2024 -smt2 -in", mLogger, mServices, new ToolchainStorage(), "z3");
		} catch (final IOException e) {
			throw new AssertionError(e);
		}
//		script = new SMTInterpol();
		mMgdScript = new ManagedScript(mServices, script);

		script.setLogic(Logics.ALL);
	}
	
	@Test
	public void varStilThereBug(){
		
		
		//Sorts
		final Sort sort_Bool = script.sort("Bool");
		final Sort sort_Int = script.sort("Int");
		final Sort sort_Array = script.sort("Array", sort_Int, sort_Int);

		//Constants
		final Term con_0 = script.numeral("0");
		final Term con_1 = script.numeral("1");

		//Vars
		final TermVariable var_v_oldvalid_88 = script.variable("v_old(#valid)_88", sort_Array);
		final TermVariable var_v_valid_207 = script.variable("v_#valid_207", sort_Array);
		final TermVariable var_v_probe3_6_p9base_40 = script.variable("v_probe3_6_~p~9.base_40", sort_Int);
		final TermVariable var_valid = script.variable("#valid", sort_Array);
		final TermVariable var_oldvalid = script.variable("old(#valid)", sort_Array);

		//Functions

		//term
		final Term term = script.quantifier(1, new TermVariable[]{var_v_oldvalid_88, var_v_oldvalid_88, var_v_oldvalid_88}, script.term("or", script.term("not", script.term("and", script.quantifier(1, new TermVariable[]{var_v_probe3_6_p9base_40, var_v_probe3_6_p9base_40}, script.term("or", script.term("=", var_v_oldvalid_88, script.term("store", script.term("store", var_v_valid_207, var_v_probe3_6_p9base_40, con_1), var_v_probe3_6_p9base_40, con_0)), script.term("=", var_v_probe3_6_p9base_40, con_0), script.term("not", script.term("=", script.term("select", var_v_valid_207, var_v_probe3_6_p9base_40), con_0)))), script.term("=", var_oldvalid, var_v_valid_207))), script.term("=", var_valid, var_v_oldvalid_88)));

		PartialQuantifierElimination.tryToEliminate(mServices, mServices.getLoggingService().getLogger("lol"), mMgdScript, term, SimplificationTechnique.SIMPLIFY_DDA, XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION);
	
		
		
		
		
//		//Sorts
//		final Sort sort_Bool = script.sort("Bool");
//		final Sort sort_Int = script.sort("Int");
//		final Sort sort_Array = script.sort("Array", sort_Int, sort_Int);
//
//		//Constants
//		final Term con_0 = script.numeral("0");
//		final Term con_1 = script.numeral("1");
//
//		//Vars
//		final TermVariable oldValid33 = script.variable("v_old(#valid)_33", sort_Array);
//		final TermVariable valid = script.variable("#valid", sort_Array);
//		final TermVariable oldValid = script.variable("old(#valid)", sort_Array);
//		final TermVariable var_v_entry_point_array7base_21 = script.variable("v_entry_point_~array~7.base_21", sort_Int);
//
//		//Functions
//
//		//term
//		final Term term = script.term("or", script.quantifier(0, new TermVariable[]{var_v_entry_point_array7base_21, var_v_entry_point_array7base_21}, script.term("and", script.term("not", script.term("=", script.term("store", script.term("store", oldValid, var_v_entry_point_array7base_21, con_1), var_v_entry_point_array7base_21, con_0), oldValid33)), script.term("=", script.term("select", oldValid, var_v_entry_point_array7base_21), con_0), script.term("not", script.term("=", var_v_entry_point_array7base_21, con_0)))), script.term("=", valid, oldValid33));
//		PartialQuantifierElimination.tryToEliminate(services, services.getLoggingService().getLogger("lol"), mgdScript, term, SimplificationTechnique.SIMPLIFY_DDA, XnfConversionTechnique.BOTTOM_UP_WITH_LOCAL_SIMPLIFICATION);
	}
	
}
