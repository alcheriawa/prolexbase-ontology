<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<h3>Scenarios of Prolexbase usage for machine translation</h3>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          I) Translating a city name 
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        We need to find the Polish equivalent of <span class="text-primary">Aix-la-Chapelle</span>, 
        which is the French name of the <span class="text-primary">German city Aachen</span>.  
        This information can be obtained from <strong>Prolexbase</strong> in the following steps:
		<ol>
		  <li> Find the <i><span class="text-success">SenseAxis</span></i> of the 
		  <i><span class="text-success">French canonical Sense</span></i> 
		  with label <span class="text-primary">"Aix-la-Chapelle"</span> 
		  (this URI is equal to <span class="text-primary">pivot/54315</span>). 
			  <pre>select ?x where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ;
:hasLexicon ?lx . ?lx :languageIdentifier "fra" .  
filter regex(?y, "Aix-la-Chapelle")
}</pre>
		  </li>
		  
		  <li> Get the label of the <i><span class="text-success">Polish canonical Sense</span></i> 
		  corresponding to the same <i><span class="text-success">SenseAxis</span></i>. 
		  Its value is <span class="text-primary">"Akwizgran"</span>. </li>
           <pre>select ?label where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ; rdfs:label ?label ; 
:hasLexicon ?lx . ?lx :languageIdentifier "pol" . 
filter regex(?x, "pivot/54315$")
}</pre>
        </ol>
      </div>
    </div>
  </div>
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
           II) Translating a name of a river which is well known in the source language but not in the target language
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
          We need to translate the Polish river name <span class="text-primary">Dunajec</span> into French. 
          This river is very well known in Poland and non ambiguous with other <i>proper names</i>. However, it may be rather 
          unknown in France in which case it should thus be cited in a French text with an explanation. 
          Such a high quality translation can be obtained from <strong>Prolexbase</strong> by the following steps:
          <ol>
          	<li> Find the <i><span class="text-success">SenseAxis</span></i> of the 
          	 <i><span class="text-success">Polish canonical Sense</span></i> with label <span class="text-primary">"Dunajec"</span> 
          	 (this URI is equal to <span class="text-primary">pivot/41686</span>).
          	     <pre>select ?x where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ;
:hasLexicon ?lx . ?lx :languageIdentifier "pol" .  
filter regex(?y, "Dunajec")
}</pre>
          	</li>
          	<li> Find the label of the <i><span class="text-success">French canonical Sense</span></i>  
          	corresponding to the same <i><span class="text-success">SenseAxis</span></i>. 
          	Its value is <span class="text-primary">"Dunajec"</span>, as in Polish.
          	     <pre>select ?y ?label where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ; rdfs:label ?label ; 
:hasLexicon ?lx . ?lx :languageIdentifier "fra" . 
filter regex(?x, "pivot/41686$")
}</pre>
          	</li>
          	<li> Find the <i><span class="text-success">frequency</span></i> value of this <i><span class="text-success">canonical Sense</span></i>  .
          	     <pre>select ?freq where { 
?x :frequency ?freq .
filter regex(?x, "fr/canonical/41686-Dunajec$")
}</pre>
          	</li>
          	<li> If <i><span class="text-success">frequency</span></i> is <span class="text-primary">"rarely used"</span>, 
          	find the <i><span class="text-success">classifying context</span></i> of this <i><span class="text-success">canonical Sense</span></i> . 
          	It's value is <span class="text-primary">"la rivière"</span>. 
          	Concatenate the <i><span class="text-success">classifying context</span></i> and the <i><span class="text-success">canonical Sense</span></i>: 
          	<span class="text-primary">"la rivière Dunajec"</span>. Otherwise use the <i><span class="text-success">canonical Sense</span></i> alone.
          	    <pre>select ?cctx where { 
?x :classification ?cl . ?cl :context ?ctx . ?ctx :hasTemplate ?cctx .
filter regex(?x, "fr/canonical/41686-Dunajec$")
}</pre>
          	</li>
          </ol>
      </div>
    </div>
  </div>
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          III) Translating an inflected name of a river which is well known in the source language but not in the target language. 
          Specifying the location of the river.
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        The name of the same river as in II) occurs in a text in one of its inflected forms <span class="text-primary">"Dunajcem"</span> (instrumental case). 
        The translation process includes the following steps:
          <ol>
          	<li> Find the <i><span class="text-success">Polish WordForm</span></i> with label 
          	<span class="text-primary">"Dunajcem"</span> and retrieve its <i><span class="text-success">LexicalEntry or Sense</span></i>  (<span class="text-primary">"entry/pol/canonical/41686-Dunajec"</span>).
          	     <pre>select ?y where { 
?x :isInstanceOf ?y . ?y rdf:type :Canonical ;
:hasLexicon ?lx . ?lx :languageIdentifier "pol" .  
filter regex(?x, "Dunajcem")
}</pre>
          	</li>
          	<li> Get the <i><span class="text-success">SenseAxis</span></i>  of this <i><span class="text-success">LexicalEntry or Sense</span></i>  
          	(<span class="text-primary">pivot/41686</span>).
          	     <pre>select ?x where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ;
:hasLexicon ?lx . ?lx :languageIdentifier "pol" .  
filter regex(?y, "entry/pol/canonical/41686-Dunajec")
}</pre>
          	</li>
          	<li> Get the <i><span class="text-success">meronym of type</span></i> <span class="text-primary">"country"</span> 
          	for this <i><span class="text-success">SenseAxis</span></i> (<span class="text-primary">pivot/44092</span>).
          	     <pre>select ?y where {
?x :holonym ?y . ?y :type :country . 
filter regex(?x, "pivot/41686$")
}</pre>
          	</li>
          	<li> Find the <i><span class="text-success">French canonical Sense</span></i>  label corresponding to 
          	the same <i><span class="text-success">SenseAxis</span></i> (<span class="text-primary">"Dunajec"</span>) 
          	and its <i><span class="text-success">classifying context</span></i> (<span class="text-primary">"la rivère"</span>).
          	    <pre>select ?y ?label ?cctx where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ; rdfs:label ?label ; 
:hasLexicon ?lx . ?lx :languageIdentifier "fra" . 
?y :classification ?cl . ?cl :context ?ctx . ?ctx :hasTemplate ?cctx .
filter regex(?x, "pivot/41686$")
}</pre>
          	</li>
          	<li> Find the <i><span class="text-success">French canonical Sense</span></i> label corresponding to the 
          	<i><span class="text-success">meronym</span></i> (<span class="text-primary">"Pologne"</span>).
          	    <pre>select ?y ?label where { 
?x :isSenseAxisOf ?y . ?y rdf:type :Canonical ; rdfs:label ?label ; 
:hasLexicon ?lx . ?lx :languageIdentifier "fra" . 
filter regex(?x, "pivot/44092$")
}</pre>
          	</li>
          	<li> Find the <i><span class="text-success">locative preposition</span></i> 
          	(<i><i><span class="text-success">functional word</span></i>) for the 
          	<i><span class="text-success">French canonical Sense</span></i> with label 
          	<span class="text-primary">"Pologne"</span> (<span class="text-primary">"en"</span>).
          	    <pre>select ?fwlabel where { 
?x :collocation ?fw . ?fw :category ?cat ; rdfs:label ?fwlabel .
filter regex(?x, "entry/fr/canonical/44092-Pologne$")
filter regex(?cat, "collocation-category/locativePreposition$")
}</pre>
          	</li>
          	<li> Concatenate the <i><span class="text-success">classifying context</span></i>, 
          	the <i><span class="text-success">canonical Sense</span></i>, 
          	<i><span class="text-success">the locative preposition of the meronym</span></i> 
          	and the <i><span class="text-success">meronym in French</span></i>: 
          	<span class="text-primary">"la rivère Dunajec en Pologne"</span>.
          	</li>
          </ol>
      </div>
    </div>
  </div>
</div>