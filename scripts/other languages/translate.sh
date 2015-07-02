#!/bin/bash

declare -A LANGUES
#répertoire où seront les fichiers générés
directory=generated
#fichier contenant les définitions minimales dépendantes de la langue
minimal_file=mapping_fr_minimal.rml
#fichier contenant les définitions minimales indépendantes de la langue
independant_file=mapping_independant.rml
#fichier temporaire
tmp_file=$directory"/temp"
#fichier contenant la définition pour toutes les langues
final_file=$directory"/mapping_all.rml"
#Fichiers db_prefs
db_prefs_minimal=db_prefs_minimal
db_prefs_independant=db_prefs_independant
db_prefs_final=$directory"/db_prefs_all"
LANGUES=([fra]=french [deu]=german [ita]=italian [por]=portuguese [spa]=spanish [nld]=dutch [eng]=english [srp]=serbian [kor]=korean [pol]=polish)
if [ ! -d $directory ]; then
	echo "Création du dossier "$directory;
	mkdir $directory
fi
#copie de la partie commune vers le grand fichier contenant tout le monde
cat $independant_file > $final_file

cat $db_prefs_independant > $db_prefs_final

#parcour des langues
for i in ${!LANGUES[@]}; do
	#le nom du fichier pour cette langue
	file=$directory"/mapping_"$i.rml
	file_pref=$directory"/db_prefs_"$i
	echo "generating R2RML mapping file for "${LANGUES[$i]}" (file $file)"
	pattern1="s/fra/"$i"/g"
	pattern2="s/french/"${LANGUES[$i]}"/g"
	# la table morphologie bien que allouée au français est commun à tout le monde
	pattern3="s/morphology_"$i"/morphology_fra/g"


	#Création de la partie minimale dans la langue
	sed -e $pattern1 -e $pattern2 -e $pattern3 $minimal_file > $tmp_file
	#sed -i -e $pattern2 $tmp_file
	#sed -i -e $pattern3 $tmp_file
	
	#Sa copie dans le fichier principale contenant toutes les langues
	cat $tmp_file >> $final_file

	#Ajout de la partie indépendante de la langue pour que le fichier puisse fonctionner seul
	cat $independant_file > $file
	cat $tmp_file >> $file

	
	echo "generating db_prefs file for "${LANGUES[$i]}" (file $file_pref)"
	#travaillons sur les fichiers de préférence
	sed -e $pattern1 $db_prefs_minimal > $tmp_file
	#sed -i -e $pattern3 $tmp_file

	cat $tmp_file >> $db_prefs_final

	cat $db_prefs_independant > $file_pref
	cat $tmp_file >> $file_pref
done
#suppression du fichier temporaire
rm $tmp_file