package de.uni_freiburg.informatik.ultimate.gui.actions;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import de.uni_freiburg.informatik.ultimate.core.api.PreludeProvider;
import de.uni_freiburg.informatik.ultimate.core.api.UltimateServices;
import de.uni_freiburg.informatik.ultimate.core.coreplugin.toolchain.ToolchainJob;
import de.uni_freiburg.informatik.ultimate.ep.ExtensionPoints;
import de.uni_freiburg.informatik.ultimate.ep.interfaces.ICore;
import de.uni_freiburg.informatik.ultimate.ep.interfaces.ISource;
import de.uni_freiburg.informatik.ultimate.gui.GuiController;
import de.uni_freiburg.informatik.ultimate.gui.contrib.PreludeContribution;
import de.uni_freiburg.informatik.ultimate.gui.interfaces.IImageKeys;
import de.uni_freiburg.informatik.ultimate.gui.interfaces.IPreferencesKeys;

import org.apache.log4j.Logger;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IConfigurationElement;
import org.eclipse.core.runtime.IExtensionRegistry;
import org.eclipse.core.runtime.Platform;
import org.eclipse.core.runtime.preferences.IEclipsePreferences;
import org.eclipse.core.runtime.preferences.InstanceScope;
import org.eclipse.jface.action.Action;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.actions.ActionFactory.IWorkbenchAction;
import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.ui.preferences.ScopedPreferenceStore;

/**
 * The action that telles the core what files to open
 * 
 * may be do modification to listen for a response..
 * 
 * 
 * @author Christian Ortolf
 * @version 0.1.0 $LastChangedDate$
 *          $LastChangedBy$LastChangedRevision: 173 $
 */
public class LoadSourceFilesAction extends Action implements IWorkbenchAction {

	/**
	 * 
	 */
	private IWorkbenchWindow m_WorkbenchWindow;

	/**
	 * 
	 */
	private ICore m_Core;

	/**
	 * 
	 */
	public static final String s_ID = "de.uni_freiburg.informatik.ultimate.gui.LoadSourceFiles";

	/**
	 * 
	 */
	public static final String s_DIALOG_NAME = "Open Source ... ";

	/**
	 * 
	 */
	private static Logger s_Logger = UltimateServices.getInstance().getControllerLogger();

	/**
	 * 
	 * @param window
	 *            the contexwindow
	 * @param ist
	 *            the steerablecore that will take the command
	 */
	public LoadSourceFilesAction(final IWorkbenchWindow window, final ICore icore) {
        this.m_WorkbenchWindow = window;
        this.m_Core = icore;
        setId(s_ID);
        setText(s_DIALOG_NAME);
        setImageDescriptor(AbstractUIPlugin.imageDescriptorFromPlugin(GuiController.sPLUGINID,
                IImageKeys.LOADSOURCEFILES));
        
    }
	/**
	 * 
	 */
	public void dispose() {
	}

	/**
	 * the action opens a file dialog
	 * then passes the files for opening to the core
	 */
	public final void run() {
        ArrayList<ISource> sourceplugins = new ArrayList<ISource>();
        IExtensionRegistry reg = Platform.getExtensionRegistry();

        IConfigurationElement[] configElements_source = reg.getConfigurationElementsFor(ExtensionPoints.EP_SOURCE);
        // iterate through every config element
        for (IConfigurationElement element : configElements_source) {
            try {
                // create class from plugin
                ISource source = (ISource) element.createExecutableExtension("class");
                // and add to plugin ArrayList
                sourceplugins.add(source);
            } catch (CoreException e) {
                s_Logger.error("Cannot create extension "+element, e);
            }
        }

        FileDialog fd = new FileDialog(m_WorkbenchWindow.getShell(), SWT.OPEN
				| SWT.MULTI);
		fd.setText(s_DIALOG_NAME);
        
        ArrayList<String> extensions = new ArrayList<String>();
        ArrayList<String> names = new ArrayList<String>();
        
		//String[] extensions = new String[sourceplugins.size() + 1];
		//String[] names = new String[sourceplugins.size() + 1];

        extensions.add("*.*");
        names.add("All");
        
        for(ISource source : sourceplugins) {
            for(String s : source.getFileTypes()) {
                extensions.add("*." + s);
                names.add(source.getName() + " (*." + s + ")");
            }
            //extensions[sourceCount] = source.getFileTypes();
            //names[sourceCount++] = source.getName();
        }
        InstanceScope iscope = new InstanceScope();
        ScopedPreferenceStore store = new ScopedPreferenceStore(iscope,GuiController.sPLUGINID);
        IEclipsePreferences prefscope = iscope.getNode(GuiController.sPLUGINID);
        String filterpath = prefscope.get(IPreferencesKeys.LASTPATH, null);
		fd.setFilterExtensions(extensions.toArray(new String[extensions.size()]));
		fd.setFilterNames(names.toArray(new String[names.size()]));
		fd.setFileName(filterpath);
		String fp = fd.open();
		if( fp != null ) {
			prefscope.put(IPreferencesKeys.LASTPATH,fp);
			try {
				store.save();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
//		String file = fd.getFileName();
		
        
//        if (!file.contains(File.separator)) {
//            for (int i=0;i<files.length;++i) {
//                files[i] = fd.getFilterPath() + File.separator + files[i]; 
//            }
//        }
		//String filterpath = fd.getFilterPath();

		// jakobro: Don't know what this is. Please correct
		// dd: obsolete because steerable core is changing right now
		// co: now changing so it works with ICore
		/*
		 * if (files.length > 0 && filterpath != null) {
		 * steerableCore.loadSourcefiles(files, filterpath); }
		 */
		// cast String to files ... and call core
//		if (files.length != 0){
//			final File[] f=new File[files.length];
//			for (int i=0; i < f.length ; i++)
//				f[i]= new File(files[i]);	
//			
		if (fp != null) {
			File prelude = PreludeContribution.getPreludeFile();
			ToolchainJob tcj = 
				new ToolchainJob("Processing Toolchain", 
						this.m_Core, 
						this.m_WorkbenchWindow, 
						new File(fp), ToolchainJob.Chain_Mode.RUN_TOOLCHAIN,
						 prelude == null ? null : new PreludeProvider(prelude.getAbsolutePath()));
			tcj.schedule();
		}
			
		//}
		
	}
}
