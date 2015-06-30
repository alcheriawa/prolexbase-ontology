package fr.li.spring.mvc.form;


import org.hibernate.validator.constraints.NotEmpty;

public class QueryForm {

    @NotEmpty
    private String sparqlQuery;
    @NotEmpty
    private String modeQuery;

    public String getSparqlQuery() {
        return sparqlQuery;
    }

    public void setSparqlQuery(final String pSparqlQuery) {
    	sparqlQuery = pSparqlQuery;
    }

    public String getModeQuery() {
        return modeQuery;
    }

    public void setModeQuery(final String pModeQuery) {
    	modeQuery = pModeQuery;
    }
}
