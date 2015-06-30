package fr.li.spring.mvc.reasoner;

import fr.inria.edelweiss.kgraph.core.Graph;

public class FactoryCoreseReasoner implements IFactoryCoreseReasoner {
	private CoreseReasoner reasoner;
	
	public FactoryCoreseReasoner() {
		reasoner = new CoreseReasoner();
	}

	public Graph getReasoner() {
		if(reasoner==null)
			reasoner=new CoreseReasoner();
		return reasoner.getReasoner();
	}
	
	
}
