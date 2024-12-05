#!/bin/bash

ROOT="C:\Users\GameSup\Sébastien Albert\Corrections SAE"
STUDENT_NAMES=(
"JemoelSamuelAblay"
"AnthonyBarman"
"AlexCasenove"
"DavideCostaMendes"
"MaximilienDeHeer"
"YanisFornari"
"OmarLababidi"
"BenjaminLayson"
"MatteoMontano"
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
    git pull
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

# EXAM 1 : MONSTER FIGHT -----------------------------------------------------------------------------------------------------------
EXAM_NAME="MonsterFight"  # Remplacez par le chemin de votre répertoire de base
REPOSITORIES=(
"https://github.com/Jemow/MonsterFightGithub"
"https://github.com/Trijeux/MonsterFightSimulator2"
""
"https://github.com/DMC1290/tbs_game.git"
"https://github.com/StylishBoi/Monster-OOP.git"
"https://github.com/MuteBlind99/FantasyMonsterFight.git"
"https://github.com/omarwagon/monster-fight"
"https://github.com/Benjamlay/monster-simulaton.git"
"https://github.com/wixxeltv/MonsterFight.git"
)
GET_ONE_EXAM


# EXAM 2 : TREASURE HUNT -----------------------------------------------------------------------------------------------------------
EXAM_NAME="Treasure_Hunt"  # Remplacez par le chemin de votre répertoire de base
REPOSITORIES=(
"https://github.com/Jemow/TreasurHunt"
"https://github.com/Trijeux/Treasure_Hunt"
"https://github.com/kidsaresadlmaoo/TreasureHunt"
"https://github.com/DMC1290/treasure_hunt_davide_costa_mendes.git"
"https://github.com/StylishBoi/924-Treasure-Hunt"
"https://github.com/MuteBlind99/FantasyMonsterFight.git"
"https://github.com/omarwagon/treasurehunt"
"https://github.com/Benjamlay/chasse_au_tresor.git"
"https://github.com/wixxeltv/TreasureHunt.git"
)
GET_ONE_EXAM


# EXAM 3 : POKER -----------------------------------------------------------------------------------------------------------
EXAM_NAME="Poker"  # Remplacez par le chemin de votre répertoire de base
REPOSITORIES=(
"https://gitlab.com/sae924/poker-game/poker-game-jemo.git"
"https://github.com/Trijeux/HoldemPoker.git"
"https://github.com/kidsaresadlmaoo/PokerGame.git"
"https://github.com/DMC1290/projet_poker.git"
"https://github.com/StylishBoi/924-Poker_Game.git"
"https://github.com/MuteBlind99/Poker-Game.git"
"https://github.com/omarwagon/poker.git"
"https://github.com/Benjamlay/poker-game.git"
"https://github.com/wixxeltv/PokerGame.git"
)
GET_ONE_EXAM

# EXAM 4 : TREASURE SFML -----------------------------------------------------------------------------------------------------------
EXAM_NAME="Treasure_Hunt_SFML"  # Remplacez par le chemin de votre répertoire de base
REPOSITORIES=(
"https://gitlab.com/sae924/treasurehunt-sfml/treasure-hunt-sfml-jemo.git"
"https://github.com/Trijeux/Treasure_Hunt"
"https://github.com/kidsaresadlmaoo/SFML-TreasureHunt"
""
"https://github.com/StylishBoi/924-Interactive-Treasure-Map"
"https://github.com/MuteBlind99/Treasure-hunt-SFML.git"

"https://github.com/Benjamlay/essaie-treasure-hunt-SFML.git"
"https://github.com/wixxeltv/TreasureHuntGraphic.git"
)
GET_ONE_EXAM

# EXAM 5 : SUMMATIVE -----------------------------------------------------------------------------------------------------------
EXAM_NAME="SPACE_SHOOTER_SUMMATIVE"  # Remplacez par le chemin de votre répertoire de base
REPOSITORIES=(
"https://gitlab.com/sae924/space-shooter/space-shooter-jemo.git"
"https://github.com/Trijeux/Space_Shooter"
"https://github.com/kidsaresadlmaoo/SFML-SpaceShooter"
"https://github.com/DMC1290/space_shooter.git"
"https://github.com/StylishBoi/924---Space-Shooter"
"https://github.com/MuteBlind99/SpaceShooter.git"
"https://github.com/omarwagon/spaceshootermaybe"
"https://github.com/Benjamlay/new-space-shooter.git"
"https://gitlab.com/sae924/space-shooter/spaceshooter-matteom.git"
)
GET_ONE_EXAM

echo
echo "============================================================="
echo
read -p "Fin des clonages - Appuyer sur [ENTRER] pour terminer."
echo
echo "============================================================="
echo