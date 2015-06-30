package fr.li.spring.mvc.service;

import it.unibz.krdb.obda.io.PrefixManager;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.openrdf.query.MalformedQueryException;
import org.openrdf.query.QueryLanguage;
import org.openrdf.query.UnsupportedQueryLanguageException;
import org.openrdf.query.parser.QueryParserUtil;
import org.springframework.stereotype.Service;

import fr.inria.acacia.corese.exceptions.EngineException;
import fr.inria.edelweiss.kgram.api.core.Node;
import fr.inria.edelweiss.kgram.core.Mapping;
import fr.inria.edelweiss.kgram.core.Mappings;
import fr.inria.edelweiss.kgraph.core.Graph;
import fr.inria.edelweiss.kgraph.query.QueryProcess;
import fr.li.spring.mvc.exception.CustomException;
import fr.li.spring.mvc.reasoner.IFactoryCoreseReasoner;
import fr.li.spring.mvc.reasoner.IFactoryOntopReasoner;

@Service
public class ClassicQueryResult {
	
	@Resource(name="factoryCoreseReasoner")
	private IFactoryCoreseReasoner cReasoner;
	
	@Resource(name="factoryOntopReasoner")
	private IFactoryOntopReasoner oReasoner;
	
	public QueryResult runQuery(String sparqlQuery) throws CustomException {
		QueryResult qResult = null;
		Graph reasoner = cReasoner.getReasoner();
		PrefixManager pManager = oReasoner.getObdaModel().getPrefixManager();
		
		try {
			QueryProcess exec = QueryProcess.create(reasoner);
			
			long t1 = System.currentTimeMillis();
	          
            QueryParserUtil.parseQuery(QueryLanguage.SPARQL, sparqlQuery, pManager.getDefaultPrefix());
			Mappings map = exec.query(sparqlQuery);
			
			qResult = new QueryResult();
			List<String> lNameVariable = new LinkedList<String>();
            			
			List<Node> lNode = map.getSelect();
			for(Node n : lNode) {
				lNameVariable.add(n.getLabel());
			}
			
			int columnSize = lNameVariable.size();  
            qResult.setListeNameVariable(lNameVariable);
            
            List<String[]> plisteValueVariable = new ArrayList<String[]>();
            
            int idy=0;
			for (Mapping m : map){
			   String[] aux = new String[columnSize];	
			   int idx=0;
			   for(String nameVar : lNameVariable) {
				   aux[idx] = pManager.getShortForm(m.getValue(nameVar).toString());
				   idx++;
			   }
			   plisteValueVariable.add(aux);
			   idy++;
			}
			long t2 = System.currentTimeMillis();
            
            qResult.setNbResults(idy);
            qResult.setListeValueVariable(plisteValueVariable);
            qResult.setSparqlQuery(sparqlQuery);
            qResult.setSqlQuery("");
            qResult.setTimeQuery(t2-t1);
            
		} catch (EngineException e) {
			System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	throw new CustomException(e.getMessage(), e.getCause()); 
			//e.printStackTrace();
		} catch (MalformedQueryException e) {
			System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	throw new CustomException(e.getMessage(), e.getCause()); 
			//e.printStackTrace();
		} catch (UnsupportedQueryLanguageException e) {
			System.out.println(e.toString());
        	System.out.println(e.getMessage());
        	System.out.println(e.getCause().toString());
        	throw new CustomException(e.getMessage(), e.getCause()); 
			//e.printStackTrace();
		} 
			
			return qResult;
		}

}
