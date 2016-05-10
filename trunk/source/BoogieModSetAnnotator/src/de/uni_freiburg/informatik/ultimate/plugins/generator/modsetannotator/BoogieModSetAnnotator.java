/*
 * Copyright (C) 2015 Sergio Feo Arenis (arenis@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE BoogieModSetAnnotator plug-in.
 * 
 * The ULTIMATE BoogieModSetAnnotator plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE BoogieModSetAnnotator plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE BoogieModSetAnnotator plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE BoogieModSetAnnotator plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE BoogieModSetAnnotator plug-in grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.plugins.generator.modsetannotator;

import java.util.ArrayList;
import java.util.List;

import de.uni_freiburg.informatik.ultimate.boogie.preferences.PreferenceInitializer;
import de.uni_freiburg.informatik.ultimate.core.model.IAnalysis;
import de.uni_freiburg.informatik.ultimate.core.model.IObserver;
import de.uni_freiburg.informatik.ultimate.core.model.IPreferenceInitializer;
import de.uni_freiburg.informatik.ultimate.core.services.model.IToolchainStorage;
import de.uni_freiburg.informatik.ultimate.core.services.model.IUltimateServiceProvider;
import de.uni_freiburg.informatik.ultimate.models.ModelType;

/**
 * 
 * @author arenis@informatik.uni-freiburg.de
 * 
 */
public class BoogieModSetAnnotator implements IAnalysis {

	private IUltimateServiceProvider mServices;

	public String getPluginName() {
		return Activator.PLUGIN_NAME;
	}

	public String getPluginID() {
		return Activator.PLUGIN_ID;
	}

	public void init() {
	}

	/**
	 * I give you every model.
	 */
	public ModelQuery getModelQuery() {
		return ModelQuery.LAST;
	}

	/**
	 * I don't need a special tool
	 */
	public List<String> getDesiredToolID() {
		return null;
	}

	public ModelType getOutputDefinition() {
		/* use old graph type definition */
		return null;
	}

	public void setInputDefinition(ModelType graphType) {
		// not required.
	}

	// @Override
	public List<IObserver> getObservers() {
		ArrayList<IObserver> observers = new ArrayList<IObserver>();
		ModSetAnalyzer analyzer = new ModSetAnalyzer(mServices);
		observers.add(analyzer);
		observers.add(new ModSetWriter(analyzer, mServices));
		return observers;
	}

	@Override
	public boolean isGuiRequired() {
		return false;
	}

	@Override
	public IPreferenceInitializer getPreferences() {
		return new PreferenceInitializer();
	}

	@Override
	public void setToolchainStorage(IToolchainStorage storage) {
		// storage is not used by this plugin
	}

	@Override
	public void setServices(IUltimateServiceProvider services) {
		mServices = services;

	}

	@Override
	public void finish() {
		// TODO Auto-generated method stub

	}
}
