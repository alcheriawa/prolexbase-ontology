<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<x:parse var="listepages"  >
<pages>
  <page key="#" val="Home" />
  <page key="afficherWelcome" val="Query Interface" />
  <page key="useCases" val="Use Cases" /> 
  <page key="#" val="Publications" /> 
</pages>
</x:parse>

<div class="">
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
   <div class="container">
     <div class="collapse navbar-collapse">
       <ul class="nav navbar-nav">
       	 <x:forEach var="page" select="$listepages/pages/*">
       	 	<c:set var="key">
				<x:out select="$page/@key"/>
			</c:set>
		    <li class="<c:if test='${key==pageRef}'>active</c:if>"><a class="navbar-brand" href="<x:out select='$page/@key'/>">&nbsp;&nbsp; <x:out select='$page/@val'/> &nbsp;&nbsp;</a></li>   
		 </x:forEach>
       </ul>
     </div><!--/.nav-collapse -->
  </div>
</nav>
</div>