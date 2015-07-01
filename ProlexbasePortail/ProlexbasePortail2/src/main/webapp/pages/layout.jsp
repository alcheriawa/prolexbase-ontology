<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <title><spring:message code="titre.application"/></title>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <!-- Bootstrap -->
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="<c:url value='/resources/js/html5shiv.min.js'  />"></script>
          <script src="<c:url value='/resources/js/respond.min.js'  />"></script>
        <![endif]-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value='/resources/js/jquery.min.js'  />"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value='/resources/js/bootstrap.min.js'  />"></script>
        
        <style>
            .myblock { padding-top: 50px; }
            .mypre { border-width: 0px; background-color: initial; }
        </style>
    </head>
    <body>
        <div class="container">
        	<c:set var="pageRef" scope="application">
			   <tiles:insertAttribute name="pageId" />
			</c:set>
			
			<tiles:insertAttribute name="header" />
			
        	<tiles:insertAttribute name="menu" />
        
            <tiles:insertAttribute name="body" />
            
            <tiles:insertAttribute name="footer" />
                  
        </div>
        
        <script type="text/javascript">
        	
        		$("#spanModeQuery").html("<b>System used : Ontop with SPARQL 1.0</b>");
        		
        		$("#modeQuery").on("change", function()	{
        			if($("#modeQuery").val() == "virtual") 
        				$("#spanModeQuery").html("<b>System used : Ontop with SPARQL 1.0</b>");
        			else $("#spanModeQuery").html("<b>System used : Corese with SPARQL 1.1</b>");
        		});
        	
        </script>
        
    </body>
</html>
