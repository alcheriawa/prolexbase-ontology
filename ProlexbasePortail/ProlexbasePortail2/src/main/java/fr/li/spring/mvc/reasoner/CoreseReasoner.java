package fr.li.spring.mvc.reasoner;

import fr.inria.edelweiss.kgraph.core.Graph;
import fr.inria.edelweiss.kgraph.rule.RuleEngine;
import fr.inria.edelweiss.kgtool.load.Load;

public class CoreseReasoner {
	
	final String owlfile = "example/ProlexOntology_1.0.5.owl";
	final String rdffile = "example/ProlexOntology_1.0.5.rdf";
	
	private Graph reasoner;
	
	public CoreseReasoner() {
			reasoner = Graph.create();
			//reasoner = Graph.create(true);
			Load ld = Load.create(reasoner);
			ld.load(owlfile);
			ld.load(rdffile);
			RuleEngine re = RuleEngine.create(reasoner);
			re.setProfile(RuleEngine.OWL_RL);
			re.process();
	}

	public Graph getReasoner() {
		return reasoner;
	}

	public void setReasoner(Graph reasoner) {
		this.reasoner = reasoner;
	}

}
