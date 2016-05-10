/*
 * Copyright (C) 2014-2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE IRSDependencies plug-in.
 * 
 * The ULTIMATE IRSDependencies plug-in is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE IRSDependencies plug-in is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE IRSDependencies plug-in. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE IRSDependencies plug-in, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE IRSDependencies plug-in grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.plugins.analysis.irsdependencies.observers;

import org.apache.log4j.Logger;

import de.uni_freiburg.informatik.ultimate.access.BaseObserver;
import de.uni_freiburg.informatik.ultimate.models.IElement;
import de.uni_freiburg.informatik.ultimate.models.ModelType;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.irsdependencies.boogie.SymbolTable;
import de.uni_freiburg.informatik.ultimate.plugins.analysis.irsdependencies.boogie.SymbolTableTransformer;

public class SymbolTableCreator extends BaseObserver
{
	protected SymbolTable mSymbolTable;
	private final Logger mLogger;

	public SymbolTableCreator(Logger logger) {
		mLogger = logger;
	}
	
	@Override
	public void init(ModelType modelType, int currentModelIndex, int numberOfModels)
	{
		super.init(modelType, currentModelIndex, numberOfModels);
		mSymbolTable = new SymbolTable();
	}
	
	public SymbolTable getSymbolTable()
	{
		return mSymbolTable;
	}

	@Override
	public boolean process(IElement root)
	{
		SymbolTableTransformer transformer = new SymbolTableTransformer(mLogger);
		boolean finished = transformer.process(root);
		mSymbolTable = transformer.getSymbolTable();
		return finished;
	}

}
