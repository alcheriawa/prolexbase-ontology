package fr.li.spring.mvc.reasoner;

import it.unibz.krdb.obda.model.OBDAModel;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWL;

public interface IFactoryOntopReasoner {
	public QuestOWL getReasoner();
	public OBDAModel getObdaModel();
}
