package fr.li.spring.mvc.reasoner;

import it.unibz.krdb.obda.io.ModelIOManager;
import it.unibz.krdb.obda.model.OBDADataFactory;
import it.unibz.krdb.obda.model.OBDAModel;
import it.unibz.krdb.obda.model.impl.OBDADataFactoryImpl;
import it.unibz.krdb.obda.owlrefplatform.core.QuestConstants;
import it.unibz.krdb.obda.owlrefplatform.core.QuestPreferences;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWL;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWLFactory;
import it.unibz.krdb.sql.ImplicitDBConstraints;

import java.io.File;

import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.reasoner.SimpleConfiguration;

public class OntopReasoner {
	
	final String owlfile = "example/ProlexOntology_1.0.6e.owl"; 
	final String obdafile = "example/ProlexOntology_1.0.6e.obda";
	final String constraintfile = "example/ProlexOntology_1.0.6e.db_prefs";
	private QuestOWL reasoner;
	private OBDAModel obdaModel;
	
	public OntopReasoner() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			/*
			 * Load the ontology from an external .owl file.
			 */
		    OWLOntology owlOntology = loadOWLOntology(owlfile);
		
		
		    /*
			 * Load the OBDA model from an external .obda file
			 */
			OBDADataFactory fac = OBDADataFactoryImpl.getInstance();
			obdaModel = fac.getOBDAModel();
			ModelIOManager ioManager = new ModelIOManager(obdaModel);
			ioManager.load(obdafile);
			
			/*
			 * Load user implicit database constraints
			 */
			ImplicitDBConstraints constr = new ImplicitDBConstraints(constraintfile);
			
		
		    /*
			 * Prepare the configuration for the Quest instance. The example below shows the setup for
			 * Virtual ABox" mode
			 */
		    QuestPreferences p = new QuestPreferences();
		    p.setCurrentValueOf(QuestPreferences.ABOX_MODE, QuestConstants.VIRTUAL);
		    p.setCurrentValueOf(QuestPreferences.OBTAIN_FULL_METADATA, QuestConstants.FALSE);
		
		    /*
			 * Create the instance of Quest OWL reasoner.
			 */
		    QuestOWLFactory factory = new QuestOWLFactory();
		    factory.setPreferenceHolder(p);
		    factory.setOBDAController(obdaModel);
		    factory.setImplicitDBConstraints(constr);
		    
		    reasoner = (QuestOWL) factory.createReasoner(owlOntology, new SimpleConfiguration());
		    //System.out.println(reasoner);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
    }
	
	public QuestOWL getReasoner() {
		return reasoner;
	}

	public void setReasoner(QuestOWL reasoner) {
		this.reasoner = reasoner;
	}
	
	public OBDAModel getObdaModel() {
		return obdaModel;
	}

	public void setObdaModel(OBDAModel obdaModel) {
		this.obdaModel = obdaModel;
	}

	private OWLOntology loadOWLOntology(String owlFile) throws OWLOntologyCreationException {
        OWLOntologyManager owlManager = OWLManager.createOWLOntologyManager();

        return owlManager.loadOntologyFromOntologyDocument(new File(owlFile));
    }
	
	

}
