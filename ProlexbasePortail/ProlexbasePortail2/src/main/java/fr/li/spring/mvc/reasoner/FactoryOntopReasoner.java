package fr.li.spring.mvc.reasoner;

import it.unibz.krdb.obda.model.OBDAModel;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWL;

public class FactoryOntopReasoner implements IFactoryOntopReasoner {
	private OntopReasoner reasoner;
	
	public FactoryOntopReasoner() {
		reasoner = new OntopReasoner();
	}
	
	public QuestOWL getReasoner() {
		if(reasoner==null)
			reasoner=new OntopReasoner();
		return reasoner.getReasoner();
	}

	public OBDAModel getObdaModel() {
		if(reasoner==null)
			reasoner=new OntopReasoner();
		return reasoner.getObdaModel();
	}

}
