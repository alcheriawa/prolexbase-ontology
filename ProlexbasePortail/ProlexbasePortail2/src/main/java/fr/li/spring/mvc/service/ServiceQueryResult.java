package fr.li.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.li.spring.mvc.exception.CustomException;

@Service
public class ServiceQueryResult implements IServiceQueryResult {

	@Autowired
	private VirtualQueryResult virtualQuery;
	
	@Autowired
	private ClassicQueryResult classicQuery;
	
	public QueryResult runQuery(String query, String mode) throws CustomException {
		QueryResult pResult = null;
		
		if(mode.equals("virtual"))
				//pResult = (new VirtualQueryResult().runQuery(query));
				pResult = virtualQuery.runQuery(query);
			
		else 
				//pResult = (new ClassicQueryResult()).runQuery(query);
				pResult = classicQuery.runQuery(query);
			
		return pResult;
	}
	
	
}
