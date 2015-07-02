# Voici la liste des choses qu'il reste à faire
1. Ajouter les instances (WordForm & Lemma) pour AliasizationResult et DerivationResult. On pourra récupérer le prolexème et le pivot à travers une seule instance.
2. Décider si les ProperNameHypernym, Existence, Category, ... seront dans l'espace de nommage de l'ontologie ou dans celui des données.
3. Lemma: s'inspirer du script PHP de génération de ProLMF. Dans ce script, pour chaque Canonical, Alias, Derivative, AliasizatonResult et DerivationResult on crée le Lemma à partir du label sans lui attacher aucune autre information
4. SynSet:
  1. Créer un mapping pour les synonymes à deux niveaux (i.e a syn b et b syn c ==> a syn b)
  2. Les cycles dans les synonymes: demander à Denis comment traiter ces cas surtout pour choisir qui est le canonique
5. Résoudre le problème de la langue.
6. Exploiter le fichier de recherche de doublons (doublons.xlsx) et essayer les solutions préconisées.
7. Essayer de faire la même chose pour les relations en comparant les résultats théoriques à ceux donnés par Ontop
8. Revoir le script pour obtenir les autres langues. Il faut y intégrer la génération des mappings, des codes SQL et de db_prefs.