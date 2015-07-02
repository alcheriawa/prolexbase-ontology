[QueryGroup="Old"] @collection [[
[QueryItem="prlexeme_french"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Prolexeme.
	?x :language prolex:language\/french
}

[QueryItem="prolexeme_english"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>
select * where {
	?x rdf:type :Sense  ; 
		rdfs:label "Blois" ;
		:hasSenseAxis ?y . 
	?y :meronym ?z . 
	?z :type :country .  
}

[QueryItem="recherche_collocation"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x :collocation ?y.
}

[QueryItem="recherche_classification"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Classification.
}

[QueryItem="recherche_instance"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Instance;
		:morphology ?y;
		:hasPartOfSpeech ?z.
}

[QueryItem="recherche_derivative"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x :derivative ?y .
filter regex(?x, 'entry/fr/lemma/50-Barr')
}

[QueryItem="recherche_pivot"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	prolex:prolexeme\/fr\/125 :pivot ?y .
}

[QueryItem="Q1"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { ?x rdf:type :SenseAxis . }
order by ?x

[QueryItem="q1"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { ?x rdf:type :Territory . }
order by ?x

[QueryItem="q2"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { ?x :primaryHypernym :region . }
order by ?x
]]

[QueryGroup="Group1"] @collection [[
[QueryItem="q3"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { ?x rdf:type :Existence . }
order by ?x

[QueryItem="q4"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x ?y where { ?x :existence ?y . }
order by ?x

[QueryItem="q5"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x ?rel ?y where { ?x ?rel ?y . ?x a :Pivot . ?y a :Pivot .}
order by ?x

[QueryItem="q6"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x ?y where { ?x :meronym ?y . }
order by ?x

[QueryItem="q7"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x ?y where { ?x :capitalAccessible ?y . }
order by ?x

[QueryItem="q8"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x ?y where { ?x :diastraticSynonym ?y . }
order by ?x
]]

[QueryGroup="Group2"] @collection [[
[QueryItem="q21"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { ?x rdf:type :PropernameHypernym . }
order by ?x
]]

[QueryGroup="Group3"] @collection [[
[QueryItem="q31"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#select * where { :Entry-prolexeme-14 :hasDerivative ?x . ?x rdfs:label ?y . }


#select * where { ?x :isDerivativeOf  :Entry-prolexeme-14  ; rdfs:label ?y . }

select * where { ?x :hasDerivative  ?y . ?y rdfs:label ?z .  
FILTER regex(?x ,  "Entry-prolexeme-14$" ) }

[QueryItem="q32"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#select ?x where { ?x rdf:type :LexicalEntry . }

#select ?x where { ?x rdf:type :Canonical . }

#select ?x where { ?x rdf:type :Alias . }

select ?x where { ?x rdf:type :Derivative . }

#select * where { ?x rdf:type :LexicalEntry ; rdfs:label ?y .}

[QueryItem="q33"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?x where { :Entry-prolexeme-15 :hasSenseAxis ?x . }

[QueryItem="q34"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select * where { ?x :hasDerivative  ?y . ?y rdfs:label ?z .   }

#select * where { ?x :hasDerivative  ?y . ?x rdfs:label ?z .   }

#select * where { ?x :isDerivativeOf  ?y .}

[QueryItem="q35"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select  * where {
#?x rdf:type :Canonical ; rdfs:label ?y .
?x rdf:type :Canonical .

#?x rdf:type :Derivative ; rdfs:label ?y .
#?x rdf:type :Derivative .

#?x rdf:type :Alias ; rdfs:label ?y .
#?x rdf:type :Alias .

#?x rdf:type :Sense ; rdfs:label ?y .
#?x rdf:type :Sense .

}
order by ?x
]]

[QueryGroup="Requetes - opérateurs"] @collection [[
[QueryItem="holonym"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur holonym : 
##	paramètres : (pivot ?y ou un label de LexicalEntry) et le type
##  Est ce que l'on prend le pivot où le type en paramètre ?
###################################################################

select * where {
?x rdf:type :Sense .
# ?x rdfs:label "Blois" 
?x :hasSenseAxis ?y . 
?y :meronym ?z . 
#?z :type :country .  
#filter regex(?x, 'Blois')
}

[QueryItem="synonym"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur synonym : 
##  	paramètres : pivot ?x, diasystem
##  ++ explication sur le paramètre canonical
###################################################################

select * where {
?x :quasiSynonym ?y .  }

#select * where {
#?x :diaphasicSynonym ?y .  }

#select * where {
#?x :diastraticSynonym ?y .  }

#select * where {
#?x :diachronicSynonym ?y .  }

[QueryItem="is_cano"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur  is_cano : 
##  	paramètres : pivot ?x, diasystem
###################################################################

#monter au synset et redescendre sur le pivot canonical du synset
select * where {
?x :isMemberOf ?syn . ?syn :canonicPivot ?y . filter(?x=?y) }

[QueryItem="accessible_item"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>


###################################################################
##  opérateur  accessible_item : 
##  	paramètres : pivot ?P, subject_file
###################################################################
select * where {
?P :capitalAccessible ?y .  }

[QueryItem="type"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur type : 
##  	paramètres : pivot ?P
###################################################################
select * where {
?P :type ?T .  }

[QueryItem="supertype"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur supertype : 
##  	paramètres : pivot ?P
###################################################################
select * where {
?P :type/:primaryHypernym* ?T .  }

[QueryItem="projection_language"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur projection_language : retrouve le LexicalEntry canonique ?LE d'un pivot ?P 
##		      pour une langue ?L donnée
##  	paramètres : Pivot ?P, langue(lexicon)  ?L
###################################################################
select * where {
?P :isSenseAxisOf ?LE . ?LE a Canonical; :hasLexicon ?LX .  ?LX rdfs:label ?L . 
filter (lang(?L)="en") }

[QueryItem="prolexeme"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>


###################################################################
##  opérateur prolexeme : pour retrouver le LexicalEntry canonique ?C
##  	paramètres : instance ?I
###################################################################

#Solution 1 : on remonte au pivot pour trouver la forme canonique
select * where {
?I :isInstanceOf ?LE . ?LE :hasSenseAxis ?P . ?P :isSenseAxisOf ?C . ?C a :Canonical .  }

#Solution 2 : on remonte dans la hierarchie des LexicalEntry pour trouver la racine
select * where {
?I :isInstanceOf ?LE . ?LE (:isAliasOf|:isDerivativeOf)* ?C . ?C a :Canonical . }
select * where {
?I :isInstanceOf ?LE . ?LE :senseRelation* ?C . ?C a :Canonical . }

[QueryItem="baseform"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX quest: <http://obda.org/quest#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur base form : pour retrouver le lemma d'une instance ?I
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :hasInstance ?L . ?L a :Lemma .  }

[QueryItem="aliascategory"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur alias category : pour retrouver la catégorie ?C d'un alias 
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :category ?AC . ?AC rdfs:label ?C . 
filter (lang(?C)="en")  }

[QueryItem="derivationcategory"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur derivation category : pour retrouver la catégorie ?C d'une dérivée 
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :category ?AC . ?AC rdfs:label ?C . 
filter (lang(?C)="en")  }

[QueryItem="morphology"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur morphology : pour retrouver la valeur ?V pour une morphology d'une instance ?I 
##  	paramètres : instance ?I, relation correspondant au type de morphologie (case, number, gender, etc.)
###################################################################
select * where {
?I :morphology ?M . ?M :grammaticalGender ?V . }

[QueryItem="classifyingcontext"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur classifying context : pour retrouver le classifying context (template) correspondant au LexicalEntry d'une instance ?I 
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :classification ?C1 .  ?C1 :hasContext ?C2 ; :hasConstituant ?Ct . ?C2 :hasTemplate ?T . ?T rdfs:label ?TL . }

[QueryItem="reliability"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur reliability : pour retrouver le reliability code 
##                 correspondant au LexicalEntry d'une instance ?I 
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :frequency ?RC .  ?RC rdfs:label ?C . 
filter (lang(?C)="en")  }

[QueryItem="translation"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur translation : pour retrouver le language correspondant 
##                          au LexicalEntry d'une instance ?I 
##  	paramètres : instance ?I
###################################################################
select * where {
?I :isInstanceOf ?LE . ?LE :hasLexicon ?LX .  ?LX rdfs:label ?C . 
filter (lang(?C)="en")  }

[QueryItem="derivation"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur derivation : retrouve la dérivation ?D d'un LexicalEntry ?LE
##                         pour une catégorie de dérivation ?Cat 
##  	paramètres : LexicalEntry ?LE, derivation category ?Cat
###################################################################
select * where {
?LE :hasDerivative ?D . ?D :category ?AC . ?AC rdfs:label ?Cat . }

# si l'on veut récupérer aussi son lemma 
select * where {
?LE :hasDerivative ?D . ?D :category ?AC ; :hasInstance ?I . 
       ?AC rdfs:label ?Cat . ?I a :Lemma . }

[QueryItem="inflect"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur inflect : retrouve l'instance correspondante à un LexicalEntry ?LE
##                     pour une morphologie ?MLabel et un part of speech ?PosLabel 
##  	paramètres : LexicalEntry ?LE, morphology ?MLabel, part of speech ?PosLabel
###################################################################
select * where {
?LE :hasInstance ?I . ?I :category ?Pos ; :morphology ?M . 
        ?Pos rdfs:label ?PosLabel . ?M rdfs:label ?MLabel . }

[QueryItem="alias"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

###################################################################
##  opérateur alias : retrouve l'alias ?A d'un LexicalEntry ?LE
##                         pour une catégorie d'alias ?Cat 
##  	paramètres : LexicalEntry ?LE, alias category ?Cat
###################################################################
select * where {
?LE :hasAlias ?D . ?D :category ?AC . ?AC rdfs:label ?Cat . }

# si l'on veut récupérer aussi son lemma 
select * where {
?LE :hasAlias ?D . ?D :category ?AC ; :hasInstance ?I . 
       ?AC rdfs:label ?Cat . ?I a :Lemma . }
]]

[QueryGroup="Mouhamad"] @collection [[
[QueryItem="classification"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT ?x ?temp ?cons WHERE {
	?x :classification ?y.
	?y :context ?c .
	?y :constituant ?cons .
	?c :hasTemplate ?temp
}

[QueryItem="instances"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Form .
#	?x a :WordForm .
#	?x a :Lemma .
}

[QueryItem="morphology_dkg"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT *  WHERE {
	?x a :Morphology .
}

[QueryItem="functionalWord"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :FunctionalWord .
}

[QueryItem="lexicalEntry"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
#	?x a :LexicalEntry .
#	?x a :Alias .
#	?x a :Derivative .
	?x a :Canonical .
}
ORDER BY ?x

[QueryItem="lexicon"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Lexicon .
}

[QueryItem="constituant"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :ConstituantElement .
}
ORDER BY ?x

[QueryItem="synset"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :SynSet .
}

[QueryItem="aliasization"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX prolex: <http://www.univ-tours.fr/li/Prolex/data/>

SELECT * WHERE {
	?x a :Alias .
}
]]

[QueryGroup="Recherche de doublons"] @collection [[
[QueryItem="Prolexeme"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour canonical : 70831
#réponse attendu pour derivative : 21299
#réponse attendu pour alias : 4670
#réponse attendu pour sense : 96800
#réponse attendu pour lexicalentry : 96800

select  * where {
#?x rdf:type :Canonical ; rdfs:label ?y .
?x rdf:type :Canonical .

#?x rdf:type :Derivative ; rdfs:label ?y .
#?x rdf:type :Derivative .

#?x rdf:type :Alias ; rdfs:label ?y .
#?x rdf:type :Alias .

#?x rdf:type :Sense ; rdfs:label ?y .
#?x rdf:type :Sense .

#?x rdf:type :LexicalEntry ; rdfs:label ?y .
#?x rdf:type :LexicalEntry .

}
order by ?x

[QueryItem="Pivot"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour SenseAxis : 73365 
#réponse attendu pour Existence : 3
#réponse attendu pour diaphasicSynonym :  384
#réponse attendu pour diachronicSynonym :  344
#réponse attendu pour diastraticSynonym :  764
#réponse attendu pour quasiSynonym :  1492
#Exemples de transitivité de quasiSynonym : 45071 - 49440 - 45072, 47751- 45497 - 55886
#réponse attendu pour meronym :  67417
#réponse attendu pour accessible :  3908

select  * where {
?x rdf:type :SenseAxis .
#?x rdf:type :Existence .
#?x :diaphasicSynonym ?y .
#?x :diachronicSynonym ?y .
#?x :diastraticSynonym ?y .
#?x :quasiSynonym ?y . 
#?x :quasiSynonym ?y . ?y :quasiSynonym ?z . filter (?x != ?z)
#?x :meronym ?y . 
#?x :accessible ?y .
}
order by ?x

[QueryItem="ProperName"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour PropernameHypernym : 39

select  * where {
?x rdf:type :PropernameHypernym .
#?x :primaryHypernym ?y .
#?x :secondaryHypernym ?y .
#?x :hypernym ?y .
}
order by ?x

[QueryItem="Lexicon"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour Lexicon : 10

select  * where {
?x rdf:type :Lexicon ; rdfs:label ?y .

}
order by ?x

[QueryItem="ConstituantElement"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour ConstituantElement : normalement 11 éléments


select  distinct * where {
?x rdf:type :ConstituantElement .

}
order by ?x

[QueryItem="ReabilityCode"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour ReabilityCode : 3 

select  * where {
?x rdf:type :ReliabilityCode .

}
order by ?x

[QueryItem="Category"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour AliasCategory : 9
#réponse attendu pour DerivativeCategory : 13 
#réponse attendu pour CollocationCategory : 2
#réponse attendu pour PartOfSpeech : 7 
#réponse attendu pour Category : normalement 31 éléments (21330 actuellement)

select  * where {
#?x rdf:type :AliasCategory .
#?x rdf:type :DerivativeCategory .
#?x rdf:type :CollocationCategory .
#?x rdf:type :PartOfSpeech .
?x rdf:type :Category .

}
order by ?x

[QueryItem="FunctionalWord"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour FunctionalWord : 10
#réponse attendu pour collocation avec Canonical: 52019
#réponse attendu pour collocation avec Alias : 192
#réponse attendu pour collocation en tout : 52211


select  * where {
#?x rdf:type :FunctionalWord .
#?x rdf:type :FunctionalWord . ?x :category ?y .

#?x :collocation ?y ; rdf:type :Canonical .
#?x :collocation ?y ; rdf:type :Alias .
?x :collocation ?y  .

}
order by ?x

[QueryItem="Morphology"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour Morphology : 9
#réponse attendu pourle predicat morphology avec ClassifyingContext : 240
#réponse attendu pourle predicat morphology avec AccessibilityContext : 101
#réponse attendu pourle predicat morphology en tout : 

select  * where {
#?x rdf:type :Morphology .
#?x :morphology ?y; rdf:type :ClassifyingContext .
#?x :morphology ?y; rdf:type :AccessibilityContext .
#?x :morphology ?y .
}
order by ?x

[QueryItem="Classification"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour ClassifyingContext : 240
#réponse attendu pour AccessibilityContext : 101
#réponse attendu pour Context : 341

#réponse attendu pour Classification : 240
#réponse attendu pour le prédicat classification avec Canonical : 45357
#réponse attendu pour le prédicat classification avec Alias :  0
#réponse attendu pour le prédicat classification en tout :  45357

#réponse attendu pour Accessibility : 
#réponse attendu pour le prédicat hasAccessibility avec Canonical : 
#réponse attendu pour le prédicat hasAccessibility avec Alias :  
#réponse attendu pour le prédicat hasAccessibility en tout :  


select  * where {
#?x rdf:type :ClassifyingContext .
#?x rdf:type :AccessibilityContext .
#?x rdf:type :Context .

?x rdf:type :Classification .
#?x :classification  ?y ; rdf:type :Canonical .
#?x :classification  ?y ; rdf:type :Alias .
#?x :classification  ?y .

#?x rdf:type :Accessibility .
#?x :hasAccessibility  ?y ; rdf:type :Canonical .
#?x :hasAccessibility  ?y ; rdf:type :Alias .
#?x :hasAccessibility  ?y .



}
order by ?x

[QueryItem="EponymExpression"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour Antonomasia : 1
#réponse attendu pour Idiom : 1
#réponse attendu pour Terminology : 1
#réponse attendu pour EponymExpression : 3

#réponse attendu pour hasAntonomasia : 1
#réponse attendu pour hasIdiom :  1
#réponse attendu pour hasTerminology : 1 
#réponse attendu pour hasEponym : 3

select  * where {
#?x rdf:type :Antonomasia .
#?x rdf:type :Idiom .
#?x rdf:type :Terminology .
#?x rdf:type :EponymExpression .

#?x :hasAntonomasia  ?y .
#?x :hasIdiom  ?y .
#?x :hasTerminology  ?y .
?x :hasEponym ?y .

}
order by ?x

[QueryItem="Form"]
PREFIX : <http://www.univ-tours.fr/li/Prolex/Ontology#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#réponse attendu pour Lemma : 17300
#réponse attendu pour WordForm : 130218
#réponse attendu pour Form : 147518

select  * where {
#?x rdf:type :Lemma .
#?x rdf:type :WordForm .
#?x rdf:type :Form .

#?x :hasInstance  ?y .

}
order by ?x
]]
