/*
 * Copyright (C) 2013-2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE Core.
 * 
 * The ULTIMATE Core is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE Core is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Core. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Core, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE Core grant you additional permission 
 * to convey the resulting work.
 */
package de.uni_freiburg.informatik.ultimate.core.preferences;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UnknownFormatConversionException;

import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Platform;
import org.eclipse.core.runtime.preferences.DefaultScope;
import org.eclipse.core.runtime.preferences.IEclipsePreferences;
import org.eclipse.core.runtime.preferences.IEclipsePreferences.IPreferenceChangeListener;
import org.eclipse.core.runtime.preferences.IScopeContext;
import org.eclipse.core.runtime.preferences.InstanceScope;
import org.osgi.service.prefs.BackingStoreException;

import de.uni_freiburg.informatik.ultimate.util.CoreUtil;

public class UltimatePreferenceStore {

	private final String mPluginID;

	private static Map<String, Set<IPreferenceChangeListener>> sActiveListener = new HashMap<String, Set<IPreferenceChangeListener>>();

	public UltimatePreferenceStore(String pluginID) {
		mPluginID = pluginID;
	}

	/*********************************** Getter ***********************************/

	/**
	 * Retrieves a preference value of type boolean from the store. If the key
	 * is neither in the current store nor in the default store, false is
	 * returned.
	 * 
	 * @param key
	 * @return
	 */
	public boolean getBoolean(String key) {
		return getBoolean(key, false);
	}

	public boolean getBoolean(String key, boolean defaultValue) {
		return getInstance().getBoolean(key, getDefault().getBoolean(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type String from the store. If the key is
	 * neither in the current store nor in the default store, "" is returned.
	 * 
	 * @param key
	 * @return
	 */
	public String getString(String key) {
		return getString(key, "");
	}

	public String getString(String key, String defaultValue) {
		return getInstance().get(key, getDefault().get(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type T, where T is a subtype of Enum,
	 * from the store. If the key is neither in the current store nor in the
	 * default store, an UnknownFormatConversionException is returned.
	 * 
	 * @param key
	 * @param enumType
	 * @return
	 * @throws UnknownFormatConversionException
	 */
	public <T extends Enum<T>> T getEnum(String key, Class<T> enumType) throws UnknownFormatConversionException {
		final String strValue = getString(key);
		if (strValue.isEmpty()) {
			throw new UnknownFormatConversionException("String " + strValue + " cannot be converted to type "
					+ enumType);
		} else {
			return Enum.valueOf(enumType, strValue);
		}
	}

	/**
	 * Retrieves a preference value of type T, where T is a subtype of Enum,
	 * from the store. If the key is neither in the current store nor in the
	 * default store, defaultValue is returned.
	 * 
	 * @param key
	 * @param defaultValue
	 * @param enumType
	 * @return
	 */
	public <T extends Enum<T>> T getEnum(String key, T defaultValue, Class<T> enumType) {
		final String strValue = getString(key);
		if (strValue.isEmpty()) {
			return defaultValue;
		} else {
			return Enum.valueOf(enumType, strValue);
		}
	}

	/**
	 * Retrieves a preference value of type byte[] from the store. If the key is
	 * neither in the current store nor in the default store, an empty byte
	 * array of length 0 is returned.
	 * 
	 * @param key
	 * @return
	 */
	public byte[] getByteArray(String key) {
		return getByteArray(key, new byte[0]);
	}

	public byte[] getByteArray(String key, byte[] defaultValue) {
		return getInstance().getByteArray(key, getDefault().getByteArray(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type double from the store. If the key is
	 * neither in the current store nor in the default store, 0.0d is returned.
	 * 
	 * @param key
	 * @return
	 */
	public double getDouble(String key) {
		return getDouble(key, 0.0d);
	}

	public double getDouble(String key, double defaultValue) {
		return getInstance().getDouble(key, getDefault().getDouble(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type float from the store. If the key is
	 * neither in the current store nor in the default store, 0.0f is returned.
	 * 
	 * @param key
	 * @return
	 */
	public float getFloat(String key) {
		return getFloat(key, 0.0f);
	}

	public float getFloat(String key, float defaultValue) {
		return getInstance().getFloat(key, getDefault().getFloat(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type int from the store. If the key is
	 * neither in the current store nor in the default store, 0 is returned.
	 * 
	 * @param key
	 * @return
	 */
	public int getInt(String key) {
		return getInt(key, 0);
	}

	public int getInt(String key, int defaultValue) {
		return getInstance().getInt(key, getDefault().getInt(key, defaultValue));
	}

	/**
	 * Retrieves a preference value of type long from the store. If the key is
	 * neither in the current store nor in the default store, 0L is returned.
	 * 
	 * @param key
	 * @return
	 */
	public long getLong(String key) {
		return getLong(key, 0L);
	}

	public long getLong(String key, long defaultValue) {
		return getInstance().getLong(key, getDefault().getLong(key, defaultValue));
	}

	/*********************************** End Getter ***********************************/

	/*********************************** Setter ***********************************/

	public void put(String key, String value) {
		getInstance().put(key, value);
		try {
			getInstance().flush();
		} catch (BackingStoreException e) {
			e.printStackTrace();
		}
	}

	/*********************************** End Setter ***********************************/

	public void addPreferenceChangeListener(IPreferenceChangeListener iPreferenceChangeListener) {
		addPreferenceChangeListener(mPluginID, iPreferenceChangeListener);

	}

	private static void addPreferenceChangeListener(String id, IPreferenceChangeListener iPreferenceChangeListener) {
		InstanceScope.INSTANCE.getNode(id).addPreferenceChangeListener(iPreferenceChangeListener);

		Set<IPreferenceChangeListener> set = sActiveListener.get(id);
		if (set == null) {
			set = new HashSet<>();
			sActiveListener.put(id, set);
		}
		set.add(iPreferenceChangeListener);
	}

	public void removePreferenceChangeListener(IPreferenceChangeListener iPreferenceChangeListener) {
		getInstance().removePreferenceChangeListener(iPreferenceChangeListener);
		if (sActiveListener.containsKey(mPluginID)) {
			sActiveListener.get(mPluginID).remove(iPreferenceChangeListener);
		}
	}

	public IEclipsePreferences getDefaultEclipsePreferences() {
		return getDefault();
	}

	public IEclipsePreferences getEclipsePreferences() {
		return getInstance();
	}

	public IScopeContext getScopeContext() {
		return InstanceScope.INSTANCE;
	}

	public void exportPreferences(OutputStream outputStream) throws CoreException {
		Platform.getPreferencesService().exportPreferences(getInstance(), outputStream, null);
	}

	public static IStatus importPreferences(InputStream inputStream) throws CoreException {
		final IStatus status = Platform.getPreferencesService().importPreferences(inputStream);
		if (status.isOK()) {
			for (Entry<String, Set<IPreferenceChangeListener>> entry : sActiveListener.entrySet()) {
				for (IPreferenceChangeListener listener : entry.getValue()) {
					InstanceScope.INSTANCE.getNode(entry.getKey()).removePreferenceChangeListener(listener);
					addPreferenceChangeListener(entry.getKey(), listener);
				}
			}

		}
		return status;
	}

	public String getDefaultPreferencesString() {
		final StringBuilder sb = new StringBuilder();
		try {
			final String br = CoreUtil.getPlatformLineSeparator();
			for (final String key : getDefault().keys()) {
				sb.append(key).append("=").append(getDefault().get(key, "NO DEFAULT SET")).append(br);
			}
		} catch (BackingStoreException e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}

	public String getCurrentPreferencesString() {
		final StringBuilder sb = new StringBuilder();
		try {
			final String br = CoreUtil.getPlatformLineSeparator();
			for (final String key : getDefault().keys()) {
				sb.append(key).append("=").append(getString(key, "NO DEFAULT SET")).append(br);
			}
		} catch (BackingStoreException e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}

	/**
	 * Get an array of strings were each entry represents all preferences that
	 * differ from their default values.
	 * 
	 */
	public String[] getDeltaPreferencesStrings() {
		final List<String> rtr = new ArrayList<>();
		final String fallback = "NO DEFAULT SET";
		try {
			final IEclipsePreferences defaults = getDefault();
			final IEclipsePreferences instance = getInstance();
			for (final String defaultKey : defaults.keys()) {
				final String defaultValue = defaults.get(defaultKey, fallback);
				final String currentValue = instance.get(defaultKey, defaultValue);
				if (!currentValue.equals(defaultValue)) {
					rtr.add(defaultKey + "=" + currentValue);
				}
			}
		} catch (BackingStoreException e) {
			e.printStackTrace();
			return null;
		}

		return rtr.toArray(new String[rtr.size()]);
	}

	@Override
	public String toString() {
		return mPluginID + " UltimatePreferenceStore";
	}

	private IEclipsePreferences getInstance() {
		return InstanceScope.INSTANCE.getNode(mPluginID);
	}

	private IEclipsePreferences getDefault() {
		return DefaultScope.INSTANCE.getNode(mPluginID);
	}

}
