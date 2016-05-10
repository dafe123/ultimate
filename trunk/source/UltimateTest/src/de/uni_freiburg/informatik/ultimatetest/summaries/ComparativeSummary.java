/*
 * Copyright (C) 2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE Test Library.
 * 
 * The ULTIMATE Test Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE Test Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Test Library. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Test Library, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE Test Library grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimatetest.summaries;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;

import de.uni_freiburg.informatik.ultimate.util.CoreUtil;
import de.uni_freiburg.informatik.ultimatetest.UltimateRunDefinition;
import de.uni_freiburg.informatik.ultimatetest.UltimateTestSuite;
import de.uni_freiburg.informatik.ultimatetest.reporting.ExtendedResult;
import de.uni_freiburg.informatik.ultimatetest.reporting.NewTestSummary;
import de.uni_freiburg.informatik.ultimatetest.util.TestUtil;

public class ComparativeSummary extends NewTestSummary {

	public ComparativeSummary(Class<? extends UltimateTestSuite> ultimateTestSuite) {
		super(ultimateTestSuite);
	}

	@Override
	public String getSummaryLog() {
		PartitionedResults partitionedResults = getAllResultsPartitioned();

		final HashMap<String, HashSet<Entry<UltimateRunDefinition, ExtendedResult>>> tool2entry = new HashMap<>();
		final HashMap<String, HashSet<String>> file2tool = new HashMap<>();
		HashMap<String, HashSet<Entry<UltimateRunDefinition, ExtendedResult>>> file2entries = new HashMap<>();

		for (Entry<UltimateRunDefinition, ExtendedResult> entry : partitionedResults.All) {
			String tool = entry.getKey().getToolchain().getAbsolutePath() + "+"
					+ entry.getKey().getSettings().getAbsolutePath();
			String filename = entry.getKey().getInputFileNames();
			HashSet<Entry<UltimateRunDefinition, ExtendedResult>> entries = tool2entry.get(tool);
			if (entries == null) {
				entries = new HashSet<>();
				tool2entry.put(tool, entries);
			}
			entries.add(entry);

			HashSet<String> tools = file2tool.get(entry);
			if (tools == null) {
				tools = new HashSet<>();
				file2tool.put(filename, tools);
			}
			tools.add(tool);

			HashSet<Entry<UltimateRunDefinition, ExtendedResult>> fEntries = file2entries.get(filename);
			if (fEntries == null) {
				fEntries = new HashSet<>();
				file2entries.put(filename, fEntries);
			}
			fEntries.add(entry);
		}

		Collection<Entry<UltimateRunDefinition, ExtendedResult>> mismatches = CoreUtil.where(partitionedResults.Error,
				new ITestSummaryResultPredicate() {
					@Override
					public boolean check(Entry<UltimateRunDefinition, ExtendedResult> entry) {
						HashSet<String> tools = file2tool.get(entry.getKey().getInputFileNames());
						for (String tool : tools) {
							if (!tool2entry.containsKey(tool)) {
								return false;
							}
						}
						return true;
					}
				});

		// HashSet<Entry<UltimateRunDefinition, ExtendedResult>> mismatchesSet =
		// new HashSet<>(mismatches);

		StringBuilder sb = new StringBuilder();
		sb.append("#################");
		sb.append(" Mismatching errors ");
		sb.append("#################");
		sb.append(CoreUtil.getPlatformLineSeparator());
		String indent = "    ";
		for (Entry<UltimateRunDefinition, ExtendedResult> mismatch : mismatches) {
			String filename = mismatch.getKey().getInputFileNames();
			sb.append(filename);
			sb.append(CoreUtil.getPlatformLineSeparator());
			for (Entry<UltimateRunDefinition, ExtendedResult> differentEntry : file2entries.get(filename)) {
				String tool = TestUtil.removeTrunkToolchainPrefix(differentEntry.getKey().getToolchain().getAbsolutePath())
						+ "+" + TestUtil.removeTrunkSettingsPrefix(differentEntry.getKey().getSettings().getAbsolutePath());
				sb.append(indent);
				sb.append(tool);
				sb.append(CoreUtil.getPlatformLineSeparator());
				sb.append(indent).append(indent);
				sb.append(differentEntry.getValue().getMessage());
				sb.append(CoreUtil.getPlatformLineSeparator());
			}
			sb.append(CoreUtil.getPlatformLineSeparator());
		}
		return sb.toString();
	}

}
