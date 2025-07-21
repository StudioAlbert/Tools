#!/bin/bash

STUDENT_NAMES=(
"JemoelSamuelAblay"
"AnthonyBarman"
"MaximilienDeHeer"
"YanisFornari"
"BenjaminLayson"
"MatteoMontano"
"HugoZeitan"
)
EXAM_NUM=1

# CLONE DES REPOS DE UN EXAMEN
GET_ONE_EXAM(){


BASE_FOLDER="$EXAM_NUM - $EXAM_NAME" 
((EXAM_NUM++))

echo
echo "Début de récupération de Exam : $BASE_FOLDER"
echo "-----------------------------------------------------------------"       

# Vérifier si le répertoire de base existe, sinon créer
if [ ! -d "$BASE_FOLDER" ]; then
    echo "Le répertoire de base $BASE_FOLDER n'existe pas, création..."
    mkdir -p "$BASE_FOLDER"
fi

# Changer de répertoire vers la destination
cd "$BASE_FOLDER" || exit

STUDENT_NUM=0

# Cloner chaque dépôt dans le répertoire de destination
for REPO in "${REPOSITORIES[@]}"; do
    
    STUDENT_FOLDER="${STUDENT_NAMES[$STUDENT_NUM]}"
    ((STUDENT_NUM++))
 
  if [ ! -d "$STUDENT_FOLDER" ]; then
    echo "Le repo $REPO : $STUDENT_FOLDER n'existe pas, clonage..."
    echo "-----------------------------------------------------------------"       
    #mkdir -p "$STUDENT"
    git clone "$REPO" "$STUDENT_FOLDER"
    echo
            
  else 
    echo "Le repo $REPO : $STUDENT_FOLDER existe, mise à jour..."
    echo "-----------------------------------------------------------------"       
    cd "$STUDENT_FOLDER" || exit

    if ["$CAN_PULL" -eq $true]; then
      git pull
    else
      cd "! pas de pull pour ce module !"
    fi
    cd ".."
    echo
    
  fi
    
done

cd ".."

echo "Tous les dépôts ont été clonés avec succès !"
echo "$EXAM_NAME Terminé."
echo "-----------------------------------------------------------------"       
echo

}

# EXAM 1 -----------------------------------------------------------------------------------------------------------
EXAM_NAME="CITY_BUILDER"  # Remplacez par le chemin de votre répertoire de base
CAN_PULL=$true
REPOSITORIES=(
"https://gitlab.com/sae924/sfml3/citybuilder.git"
"https://github.com/Trijeux/CityBuilder2.git"
"https://github.com/StylishBoi/CityBuilder_SFML.git"
"https://github.com/MuteBlind99/CityBuilder_SFML_SR.git"
"https://github.com/Benjamlay/cityBuilderTestSFML.git"
"https://gitlab.com/sae924/sfml3/citybuilder-matteom.git"
"https://github.com/XhugrevolutionX/CityBuilder.git"
)
GET_ONE_EXAM


# EXAM 2 -----------------------------------------------------------------------------------------------------------
EXAM_NAME="EXAM"  # Remplacez par le chemin de votre répertoire de base
CAN_PULL=$false
REPOSITORIES=(
"https://github.com/Jemow/924_4FSC0PF003_Summative.git"
"https://github.com/Trijeux/924_4FSC0PF003_Summative_Anthony.git"
"https://github.com/StylishBoi/924_4FSC0PF003_Summative_Maximilien.git"
"https://github.com/MuteBlind99/924_4FSC0PF003_Summative_YanisFornari.git"
"https://github.com/Benjamlay/Benjamin_Layson_924_4FSC0PF003_Summative.git"
"https://github.com/wixxeltv/924_4FSC0PF003_Summative_MatteoM.git"
"https://github.com/XhugrevolutionX/924_4FSC0PF003_Summative_Hugo_Z.git"
)
GET_ONE_EXAM

echo
echo "============================================================="
echo
read -p "Fin des clonages - Appuyer sur [ENTRER] pour terminer."
echo
echo "============================================================="
echo