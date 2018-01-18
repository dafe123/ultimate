package de.uni_freiburg.informatik.ultimate.icfgtransformer.heapseparator;

import java.util.Map;

import de.uni_freiburg.informatik.ultimate.core.model.services.ILogger;
import de.uni_freiburg.informatik.ultimate.icfgtransformer.IBacktranslationTracker;
import de.uni_freiburg.informatik.ultimate.icfgtransformer.ILocationFactory;
import de.uni_freiburg.informatik.ultimate.icfgtransformer.IcfgTransitionTransformer;
import de.uni_freiburg.informatik.ultimate.logic.Term;
import de.uni_freiburg.informatik.ultimate.logic.TermVariable;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.structure.IIcfg;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.structure.IcfgEdge;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.structure.IcfgLocation;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.transitions.TransFormulaBuilder;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.transitions.UnmodifiableTransFormula;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.cfg.variables.IProgramVar;
import de.uni_freiburg.informatik.ultimate.modelcheckerutils.smt.managedscript.ManagedScript;

public class PartitionProjectionTransitionTransformer<INLOC extends IcfgLocation, OUTLOC extends IcfgLocation>
		extends IcfgTransitionTransformer<INLOC, OUTLOC> {

	private ManagedScript mMgdScript;

	public PartitionProjectionTransitionTransformer(final ILogger logger, final String resultName,
			final Class<OUTLOC> outLocClazz,
			final IIcfg<INLOC> inputCfg, final ILocationFactory<INLOC, OUTLOC> funLocFac,
			final IBacktranslationTracker backtranslationTracker) {
		super(logger, resultName, outLocClazz, inputCfg, funLocFac, backtranslationTracker);
		// TODO Auto-generated constructor stub
	}

	@Override
	public IcfgEdge transform(final IcfgEdge edge, final OUTLOC newSource,
			final OUTLOC newTarget) {

		final UnmodifiableTransFormula tf = edge.getTransformula();

		final Term transformedFormula = new PartitionProjectionTermTransformer().transform(tf.getFormula());

		final Map<IProgramVar, TermVariable> inVars = null;
		final Map<IProgramVar, TermVariable> outVars = null;

		final TransFormulaBuilder tfBuilder = new TransFormulaBuilder(inVars, outVars,
				tf.getNonTheoryConsts().isEmpty(), tf.getNonTheoryConsts(), tf.getBranchEncoders().isEmpty(),
				tf.getBranchEncoders(), tf.getAuxVars().isEmpty());

		tfBuilder.setFormula(transformedFormula);
		tfBuilder.setInfeasibility(tf.isInfeasible());

		final UnmodifiableTransFormula newTransformula = tfBuilder.finishConstruction(mMgdScript);

		return transform(edge, newSource, newTarget, newTransformula);
	}

}
