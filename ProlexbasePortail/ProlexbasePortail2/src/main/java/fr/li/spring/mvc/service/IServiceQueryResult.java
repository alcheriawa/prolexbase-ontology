package fr.li.spring.mvc.service;

import fr.li.spring.mvc.exception.CustomException;

public interface IServiceQueryResult {
	
	QueryResult runQuery(String query, String mode) throws CustomException;

}
