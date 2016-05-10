/*
 * Copyright (C) 2014-2015 Daniel Dietsch (dietsch@informatik.uni-freiburg.de)
 * Copyright (C) 2014-2015 Jochen Hoenicke (hoenicke@informatik.uni-freiburg.de)
 * Copyright (C) 2009-2015 University of Freiburg
 * 
 * This file is part of the ULTIMATE Util Library.
 * 
 * The ULTIMATE Util Library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * The ULTIMATE Util Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with the ULTIMATE Util Library. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify the ULTIMATE Util Library, or any covered work, by linking
 * or combining it with Eclipse RCP (or a modified version of Eclipse RCP), 
 * containing parts covered by the terms of the Eclipse Public License, the 
 * licensors of the ULTIMATE Util Library grant you additional permission 
 * to convey the resulting work.
 */

package de.uni_freiburg.informatik.ultimate.util.datastructures;

import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import de.uni_freiburg.informatik.ultimate.util.ScopeUtils;


/**
 * A scoped hash map is useful for symbol tables. With beginScope() a new
 * scope is started.  All modifications to the table are reversed when
 * the scope is ended with endScope().
 * 
 * You can also get a key, entry, or value collection of the currently
 * active scope.  This will only iterate the keys/values set since the last
 * beginScope() call.  Removing an entry will restore the value that was
 * previously set on the outer scope.
 * 
 * Note that it is forbidden to store null values into a scoped hash map.
 * 
 * @author Jochen Hoenicke
 *
 * @param <K> Key type
 * @param <V> Value type
 */
public class ScopedHashMap<K, V> extends AbstractMap<K, V> {

	private final HashMap<K, V> mMap;
	private HashMap<K, V>[] mHistory;
	int mCurScope = -1;
	private final boolean mShrink;
	
	public ScopedHashMap() {
		this(true);
	}
	
	@SuppressWarnings("unchecked")
	public ScopedHashMap(boolean shrink) {
		mMap = new HashMap<K, V>();
		mHistory = new HashMap[ScopeUtils.NUM_INITIAL_SCOPES];
		mShrink = shrink;
	}
	
	private HashMap<K, V> undoMap() {
		return mHistory[mCurScope];
	}
	
	private void recordUndo(K key, V value) {
		if (mCurScope != -1) {
			Map<K, V> old = undoMap();
			if (!old.containsKey(key))
				old.put(key, value);
		}
	}

	private void undoEntry(Entry<K,V> old) {
		if (old.getValue() == null)
			mMap.remove(old.getKey());
		else
			mMap.put(old.getKey(), old.getValue());
	}
	
	public void beginScope() {
		if (mCurScope == mHistory.length - 1)
			mHistory = ScopeUtils.grow(mHistory);
		mHistory[++mCurScope] = new HashMap<K, V>();
	}
	
	public void endScope() {
		for (Entry<K, V> old : undoMap().entrySet()) {
			undoEntry(old);
		}
		mHistory[mCurScope--] = null;
		if (mShrink && ScopeUtils.shouldShrink(mHistory))
			mHistory = ScopeUtils.shrink(mHistory);
	}
	
	public Iterable<Map.Entry<K, V>> currentScopeEntries() {
		if (mCurScope == -1)
			return entrySet();
		return new AbstractSet<Map.Entry<K, V>>() {
			@Override
			public Iterator<Map.Entry<K, V>> iterator() {
				return new Iterator<Map.Entry<K, V>>() {
					Iterator<Entry<K, V>> mBacking = 
							undoMap().entrySet().iterator();
					Entry<K, V> mLast;
					
					@Override
					public boolean hasNext() {
						return mBacking.hasNext();
					}

					@Override
					public Map.Entry<K, V> next() {
						final K key = (mLast = mBacking.next()).getKey();
						return new Entry<K, V>() {
							@Override
							public K getKey() {
								return key;
							}

							@Override
							public V getValue() {
								return mMap.get(key);
							}

							@Override
							public V setValue(V value) {
								return mMap.put(key, value);
							}
						};
					}

					@Override
					public void remove() {
						mBacking.remove();
						undoEntry(mLast);
					}
				};
			}

			@Override
			public int size() {
				return undoMap().size();
			}
		};
	}
	
	public Iterable<K> currentScopeKeys() {
		if (mCurScope == -1)
			return keySet();
		return new AbstractSet<K>() {
			@Override
			public Iterator<K> iterator() {
				return new Iterator<K>() {
					
					Iterator<Entry<K, V>> mBacking =
							undoMap().entrySet().iterator();
					Entry<K, V> mLast;
					
					@Override
					public boolean hasNext() {
						return mBacking.hasNext();
					}

					@Override
					public K next() {
						return (mLast = mBacking.next()).getKey();
					}

					@Override
					public void remove() {
						mBacking.remove();
						undoEntry(mLast);
					}
				};
			}

			@Override
			public int size() {
				return undoMap().size();
			}
		};
	}
	
	public Iterable<V> currentScopeValues() {
		if (mCurScope == -1)
			return values();
		return new AbstractSet<V>() {
			@Override
			public Iterator<V> iterator() {
				return new Iterator<V>() {
					
					Iterator<Entry<K, V>> mBacking =
							undoMap().entrySet().iterator();
					Entry<K, V> mLast;
					
					@Override
					public boolean hasNext() {
						return mBacking.hasNext();
					}

					@Override
					public V next() {
						return mMap.get((mLast = mBacking.next()).getKey());
					}

					@Override
					public void remove() {
						mBacking.remove();
						undoEntry(mLast);
					}
				};
			}

			@Override
			public int size() {
				return undoMap().size();
			}
		};
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void clear() {
		mMap.clear();
		mHistory = new HashMap[ScopeUtils.NUM_INITIAL_SCOPES];
	}

	@Override
	public boolean containsKey(Object key) {
		return mMap.containsKey(key);
	}

	@Override
	public boolean containsValue(Object value) {
		return mMap.containsValue(value);
	}

	@Override
	public V get(Object key) {
		return mMap.get(key);
	}

	@Override
	public boolean isEmpty() {
		return mMap.isEmpty();
	}
	
	public boolean isEmptyScope() {
		return mCurScope == -1;
	}

	@Override
	public Set<Entry<K,V>> entrySet() {
		return new AbstractSet<Entry<K,V>>() {

			@Override
			public Iterator<Entry<K,V>> iterator() {
				return new Iterator<Entry<K,V>>() {

					Iterator<Entry<K,V>> mBacking = mMap.entrySet().iterator();
					Entry<K,V> mLast;
					
					@Override
					public boolean hasNext() {
						return mBacking.hasNext();
					}

					@Override
					public Entry<K,V> next() {
						return mLast = mBacking.next();
					}

					@Override
					public void remove() {
						mBacking.remove();
						recordUndo(mLast.getKey(), mLast.getValue());
					}
				};
			}

			@Override
			public int size() {
				return mMap.size();
			}
		};
	}

	@Override
	public V put(K key, V value) {
		if (value == null)
			throw new NullPointerException();
		V oldval = mMap.put(key, value);
		recordUndo(key, oldval);
		return oldval;
	}

	@SuppressWarnings("unchecked")
	@Override
	public V remove(Object key) {
		V oldval = mMap.remove(key);
		recordUndo((K) key, oldval);
		return oldval;
	}

	@Override
	public int size() {
		return mMap.size();
	}
	
	public int getActiveScopeNum() {
		return mCurScope + 1;
	}

	/**
	 * Checks if the key was overwritten in the given scope.
	 * @param key   the key to check for.
	 * @param scope the scope number; must not be 0 for the outer most scope.
	 * @return true if the key was overwritten in the given scope.
	 */
	public boolean overwritesKeyInScope(Object key, int scope) {
		assert(scope != 0);
		return mHistory[scope - 1].containsKey(key);
	}

}
