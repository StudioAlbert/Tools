
# Afficher le premier argument
#echo "Argument 1 est : $1"
#echo "Argument 2 est : $2"
#echo "Argument 3 est : $3"

# Convertir la chaîne en tableau (séparé par des espaces)
IFS=' ' read -r -a STUDENTS <<< "$1"
DESTINATION_BASE=$2
IFS=' ' read -r -a REPOSITORIES <<< "$3"

# Vérifier si le répertoire de base existe, sinon créer
if [ ! -d "$DESTINATION_BASE" ]; then
    echo "Le répertoire de base $DESTINATION_BASE n'existe pas, création..."
    mkdir -p "$DESTINATION_BASE"
fi

# Changer de répertoire vers la destination
cd "$DESTINATION_BASE" || exit

STUDENT_NUM=0

# Cloner chaque dépôt dans le répertoire de destination
for REPO in "${REPOSITORIES[@]}"; do
    
    STUDENT="${STUDENTS[$STUDENT_NUM]}"
    ((STUDENT_NUM++))
 
    echo
    echo "-----------------------------------------------------------------"       
    echo "Clonage du dépôt $REPO ==> $STUDENT..."
    #mkdir -p "$STUDENT"
    git clone "$REPO" "$STUDENT"
    
    echo
    
done

cd ".."

echo "Tous les dépôts ont été clonés avec succès !"
echo "-----------------------------------------------------------------"       
echo    
