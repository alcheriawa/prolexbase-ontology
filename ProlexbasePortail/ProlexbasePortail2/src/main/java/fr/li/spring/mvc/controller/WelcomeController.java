package fr.li.spring.mvc.controller;


import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.li.spring.mvc.exception.CustomException;
import fr.li.spring.mvc.form.QueryForm;
import fr.li.spring.mvc.service.IServiceQueryResult;
import fr.li.spring.mvc.service.QueryResult;



@Controller
public class WelcomeController {
	
	@Autowired
	private IServiceQueryResult service;
	
	final String initQuery=
		"PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>\n"
	  + "PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>\n"		
	  +	"PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\n"
	  +	"PREFIX owl: <http://www.w3.org/2002/07/owl#>\n"
	  +	"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
	  +	"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n"
      + "select * where { \n" 
	  + "?x rdf:type :SenseAxis . \n" 
      + "}\n"
//	  +	"order by ?x \n"
	  +	"limit 10 ";
	
	final String initQuery2= "PREFIX : <http://www.semanticweb.org/ontologies/2015/1/EPNet-ONTOP_Ontology#>\n" 
	    + "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\n"
		+ "PREFIX dcterms: <http://purl.org/dc/terms/>\n"
	    + "select *\n" 
	    + "where {\n"
	    + " ?x ?p ?y .\n"
	    + "}\n"
	    + "limit 50\n";

    @RequestMapping(value="/afficherWelcome", method = RequestMethod.GET)
    public String afficher(ModelMap pModel) {
    	Map<String,String> plisteMode = new LinkedHashMap<String,String>();
    	plisteMode.put("virtual", "Virtual Graph");
    	plisteMode.put("classic", "Materialized Graph"); //Classic Graph
    	pModel.addAttribute("listeMode", plisteMode);
    	
    	 if (pModel.get("query") == null) {
    		 QueryForm pQuery = new QueryForm();
    		 pQuery.setSparqlQuery(initQuery);
    		 pQuery.setModeQuery("virtual");
             pModel.addAttribute("query", pQuery);
         }
    		
        return "welcome";
    }
    
    @RequestMapping(value="/execute", method = RequestMethod.POST)
    public String executeQuery(@Valid @ModelAttribute(value="query") final QueryForm pQuery, 
            final BindingResult pBindingResult, final ModelMap pModel) {
    	if (!pBindingResult.hasErrors()) {
    		
            QueryResult qResult;
			try {
				//we limit the response to the first 200 results
				//if(!pQuery.getSparqlQuery().contains("limit"))
				//	pQuery.setSparqlQuery(pQuery.getSparqlQuery() + "\nlimit 200");
				qResult = service.runQuery(pQuery.getSparqlQuery(), pQuery.getModeQuery());
				pModel.addAttribute("qResult", qResult);
			} /*
			catch (RuntimeException e) {
				System.out.println(e.getMessage());
				pModel.addAttribute("errors", e.getMessage()); 
				e.printStackTrace();
			}*/
			catch (CustomException e) {
				pModel.addAttribute("errors", e.getMessage()); 
				e.printStackTrace();
			}
			
            
        }
    	
    	return afficher(pModel);
    }
    
}
