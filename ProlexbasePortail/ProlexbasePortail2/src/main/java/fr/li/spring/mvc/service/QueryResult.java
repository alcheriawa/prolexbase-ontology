package fr.li.spring.mvc.service;

import java.util.List;


public class QueryResult {
	
	private int nbResults;
	private long timeQuery; //in ms
	private List<String> listeNameVariable;
	private List<String[]> listeValueVariable;
	private String sparqlQuery;
	private String sqlQuery;
	
	
	public int getNbResults() {
		return nbResults;
	}
	public void setNbResults(int nbResults) {
		this.nbResults = nbResults;
	}
	public long getTimeQuery() {
		return timeQuery;
	}
	public void setTimeQuery(long timeQuery) {
		this.timeQuery = timeQuery;
	}
	
	public String getSparqlQuery() {
		return sparqlQuery;
	}
	public void setSparqlQuery(String sparqlQuery) {
		this.sparqlQuery = sparqlQuery;
	}
	public String getSqlQuery() {
		return sqlQuery;
	}
	public void setSqlQuery(String sqlQuery) {
		this.sqlQuery = sqlQuery;
	}
	
	public List<String> getListeNameVariable() {
		return listeNameVariable;
	}
	public void setListeNameVariable(List<String> listeNameVariable) {
		this.listeNameVariable = listeNameVariable;
	}
	
	public List<String[]> getListeValueVariable() {
		return listeValueVariable;
	}
	public void setListeValueVariable(List<String[]> listeValueVariable) {
		this.listeValueVariable = listeValueVariable;
	}
	public String getValueAt(int row, int col) {
		//return listeValueVariable[row][col];
		return listeValueVariable.get(row)[col];
	}
	
	public void setValueAt(int row, int col, String pValue) {
		//listeValueVariable[row][col] = pValue;
		listeValueVariable.get(row)[col] = pValue;
	}
	
	public void limitResult() {
		//limit the number of result to 200
		
	}

}
