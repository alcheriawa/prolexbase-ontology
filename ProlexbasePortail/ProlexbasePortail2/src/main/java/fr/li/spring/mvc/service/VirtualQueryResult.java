package fr.li.spring.mvc.service;


import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import fr.li.spring.mvc.exception.CustomException;
import fr.li.spring.mvc.reasoner.IFactoryOntopReasoner;
import it.unibz.krdb.obda.io.PrefixManager;
import it.unibz.krdb.obda.model.OBDAException;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWL;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWLConnection;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWLResultSet;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.QuestOWLStatement;

import org.openrdf.query.MalformedQueryException;
import org.openrdf.query.QueryLanguage;
import org.openrdf.query.UnsupportedQueryLanguageException;
import org.openrdf.query.parser.QueryParserUtil;
import org.semanticweb.owlapi.model.OWLException;
import org.semanticweb.owlapi.model.OWLObject;
import org.springframework.stereotype.Service;

@Service
public class VirtualQueryResult {
	
	//private QueryResult qResult;
	//@Autowired
	@Resource(name="factoryOntopReasoner")
	private IFactoryOntopReasoner oReasoner;	
	//private PrefixManager pManager;
	
	public QueryResult runQuery(String sparqlQuery) throws CustomException {
		QueryResult qResult = null;
        QuestOWL reasoner = oReasoner.getReasoner();
        PrefixManager pManager = oReasoner.getObdaModel().getPrefixManager();
        	
        try {
        	/*
		 	 * Prepare the data connection for querying.
		 	 */
            QuestOWLConnection conn;
			
			conn = reasoner.getConnection();
			
            QuestOWLStatement st = conn.createStatement();
            
            long t1 = System.currentTimeMillis();
          
            QueryParserUtil.parseQuery(QueryLanguage.SPARQL, sparqlQuery, pManager.getDefaultPrefix());
            QuestOWLResultSet rs = st.executeTuple(sparqlQuery);
            
            qResult = new QueryResult();
            int columnSize = rs.getColumnCount(); 
            List<String> lNameVariable = new LinkedList<String>();
            for(String nameVar : rs.getSignature()) {
            	lNameVariable.add("?" + nameVar);
            }
            //qResult.setListeNameVariable(rs.getSignature());
            qResult.setListeNameVariable(lNameVariable);
           
           List<String[]> plisteValueVariable = new ArrayList<String[]>();
            
            int idy=0;
            while (rs.nextRow()) {
            	String[] aux = new String[columnSize];
                for (int idx = 1; idx <= columnSize; idx++) {
                    OWLObject binding = rs.getOWLObject(idx);

                    //aux[idx-1] = binding.toString();
                    aux[idx-1] = pManager.getShortForm(binding.toString());
                    //System.out.print(binding.toString() + ", ");
                    //System.out.print(pManager.getShortForm(binding.toString()));
                }
                plisteValueVariable.add(aux);
                idy++;
                //System.out.print("\n");
            }
            rs.close();
            long t2 = System.currentTimeMillis();
            
            qResult.setNbResults(idy);
            qResult.setListeValueVariable(plisteValueVariable);
            String sqlQuery = st.getUnfolding(sparqlQuery);
            qResult.setSparqlQuery(sparqlQuery);
            qResult.setSqlQuery(sqlQuery);
            qResult.setTimeQuery(t2-t1);

			/*
             * Print the query summary
             *  System.out.println();
	            System.out.println("The input SPARQL query:");
	            System.out.println("=======================");
	            System.out.println(sparqlQuery);
	            System.out.println();
	
	
	            System.out.println("The output SQL query:");
	            System.out.println("=====================");
	            System.out.println(sqlQuery);
			 */
   
          
        }
        catch (MalformedQueryException e) {
        	System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	throw new CustomException(e.getMessage(), e.getCause()); 
			//e.printStackTrace();
		} 
        catch (UnsupportedQueryLanguageException e) {
        	System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	throw new CustomException(e.getMessage(), e.getCause()); 
			//e.printStackTrace();
		}
        catch(OBDAException e) {
        	System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	//e.printStackTrace();
        	throw new CustomException(e.getMessage(), e.getCause()); 	
        } 
        catch (OWLException e) {
        	System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	//e.printStackTrace();
        	throw new CustomException(e.getMessage(), e.getCause());
		} 
        //finally {
			//reasoner.dispose();
		//}
        return qResult;
    }

}
