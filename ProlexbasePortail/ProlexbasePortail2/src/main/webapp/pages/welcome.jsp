<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${not empty errors}">
    <div class="myblock">
	    <div class="panel panel-danger">
	        <div class="panel-heading">
	            <div class="panel-title">Error</div>
	        </div>
	        <div class="panel-body">
	            <p><c:out value="${errors}"/></p>
	        </div>
	    </div>
	</div>
    <c:remove var="errors"/>
</c:if>

<form:form role="form" class="" method="post" modelAttribute="query" action="execute">
      <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
      <div class="form-group">
        <label for="sparqlQuery"><spring:message code="query.label.libelle" /></label>
      	<div id="spanModeQuery" class="alert alert-info" role="alert">...</div> 	
         <form:textarea path="sparqlQuery" class="form-control" rows="10" style="font-family:monospace;" /><br/>
		<form:select path="modeQuery" class="form-control" items="${listeMode}" /><br/><br/>
	    <button type="submit" class="btn btn-primary"><spring:message code="query.label.submit" /></button>
	  </div>  
</form:form>

<!--<p class="myblock"><strong>Note: Only the the first 200 results will be shown.</strong></p>>-->
<!--<p class="myblock" th:if="${queryresult} != null" th:text="${queryresult.time}+' ms'"></p>-->

<div class="myblock">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <div class="panel-title">
	            <a data-toggle="collapse" href="#querycatalogpanel">Sample queries</a>
	        </div>
	    </div>
        <div id="querycatalogpanel" class="panel-collapse collapse">
        	<div class="panel-body">
             	<div>
                   <p><strong>1 - Liste des pivots :</strong></p>
                   <pre class="mypre">
PREFIX : &lt;http://www.univ-tours.fr/li/Prolex/Ontology#&gt;
PREFIX &lt;http://www.w3.org/2001/XMLSchema#&gt;
PREFIX owl: &lt;http://www.w3.org/2002/07/owl#&gt;
PREFIX rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt;
PREFIX rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt;

select ?x where { ?x rdf:type :Pivot . }
order by ?x

limit 50
					</pre>
               </div>
           </div>
       </div>
	</div>
</div>
            
<div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">
                <a data-toggle="collapse" href="#ontologypanel">Ontology</a>
            </div>
        </div>
        <c:if test="${not empty qResult}">
        <div id="ontologypanel" class="panel-collapse collapse">
        </c:if>
        <c:if test="${empty qResult}">
        <div id="ontologypanel" class="panel-collapse collapse in">
        </c:if>
            <div class="panel-body">
			    <!--
			    <div class="row">
			        <div class="col-md-12">
			            <p><strong>Prefix:</strong> http://136.243.8.213/obdasystem#</p>
			        </div>
			    </div>
			    -->
			    <div class="row">
			        <div class="col-md-4">
			            <div class="row">
			                <div class="col-md-12"><p><strong>Classes:</strong></p></div>
			            </div>
			            <div class="row">
			                <div class="col-md-12"><img src="<c:url value='/resources/img/onto-classes.png'  />" /></div>
			            </div>
			        </div>
			        <div class="col-md-4">
			            <div class="row">
			                <div class="col-md-12"><p><strong>Object properties:</strong></p></div>
			            </div>
			            <div class="row">
			                <div class="col-md-12"><img src="<c:url value='/resources/img/onto-object.png'  />" /></div>
			            </div>
			        </div>
			        <div class="col-md-4">
			            <div class="row">
			                <div class="col-md-12"><p><strong>Data properties:</strong></p></div>
			            </div>
			            <div class="row">
			                <div class="col-md-12"><img src="<c:url value='/resources/img/onto-data.png'  />" /></div>
			            </div>
			       </div>
			     </div>
            </div>
        </div>   
    </div>
</div>

<c:if test="${not empty qResult}">
 <div class="myblock">
    <p><strong>Running time: </strong><span><c:out value="${qResult.timeQuery}"/> ms</span></p>
    <p><strong>Query result<span> (<c:out value="${qResult.nbResults}"/> rows)</span>:</strong></p>
    <table class="table table-striped">
    	<tr>
    		<c:forEach items="${qResult.listeNameVariable}" var="variable" >
    			<th>
    				<c:out value="${variable}"/>
    			</th>
    		</c:forEach>
    	</tr>
        <tbody>
            <c:set var="nbRows"><c:out value="${qResult.nbResults-1}"/></c:set>
            <c:if test="${qResult.nbResults > 200}">
             	<c:set var="nbRows">199</c:set>
            </c:if>
            
            <c:if test="${nbRows>-1}">
        	<c:forEach begin="0" end="${nbRows}" var="i" >
	            <tr>
	            	<c:forEach items="${qResult.listeValueVariable.get(i)}" var="lvariableV" >
	                	<td><c:out value="${lvariableV}"/></td>
	                </c:forEach>
	            </tr>      
            </c:forEach>
             </c:if>
           
        </tbody>
    </table>  
</div>
</c:if>