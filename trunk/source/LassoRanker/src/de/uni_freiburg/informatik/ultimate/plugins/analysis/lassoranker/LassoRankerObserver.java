/*
 * Copyright (C) 2014-2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2013-2015 Jan Leike (leike@informatik.uni-freiburg.de)
 * Copyright (C) 2013-2015 Matthias Heizmann (heizmann@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE LassoRanker plug-in.
 * 
 * The ULTIMATE LassoRanker plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE LassoRanker plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE LassoRanker plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE LassoRanker plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE LassoRanker plug-in grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.plugins.analysis.lassoranker;

import java.io.IOException;

import de.uni_freiburg.informatik.ultimate.access.IUnmanagedObserver;
import de.uni_freiburg.informatik.ultimate.core.services.model.IToolchainStorage;
import de.uni_freiburg.informatik.ultimate.core.services.model.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.lassoranker.LassoAnalysis;
import de.uni_freiburg.informatik.ultimate.models.IElement;
import de.uni_freiburg.informatik.ultimate.models.ModelType;
import de.uni_freiburg.informatik.ultimate.plugins.generator.rcfgbuilder.cfg.RootNode;


/**
 * Observer for LassoRanker
 * 
 * Extracts the lasso program's stem and loop transition from the RCFG builder's
 * transition graph. This is then passed to the LassoAnalysis
 * class, which serves as an interface to LassoRanker's termination and
 * non-termination analysis methods.
 * 
 * Termination and non-termination arguments are synthesizer via constraint
 * solving. The generated constraints are non-linear algebraic constraints.
 * We use an external SMT solver to solve these constraints.
 * 
 * @see LassoAnalysis
 * @author Matthias Heizmann, Jan Leike
 */
public class LassoRankerObserver implements IUnmanagedObserver {

	
	private final IUltimateServiceProvider mServices;
	private final IToolchainStorage mStorage;
	
	public LassoRankerObserver(IUltimateServiceProvider services, IToolchainStorage storage){
		mServices = services;
		mStorage = storage;
	}

	@Override
	public boolean process(IElement root) throws IOException {
		
		if (!(root instanceof RootNode)) {
			throw new UnsupportedOperationException(
					"LassoRanker can only be applied to models constructed" +
					" by the RCFGBuilder");
		}
		new LassoRankerStarter((RootNode) root, mServices, mStorage);
		return false;
	}
	
	/**
	 * @return the root of the CFG.
	 */
	public IElement getRoot(){
		return null;
	}
	
	@Override
	public void init(ModelType modelType, int currentModelIndex, int numberOfModels) {
//		Ordinal.testcases();
	}

	@Override
	public void finish() {
		// nothing to do
	}

	@Override
	public boolean performedChanges() {
		return false;
	}
}
