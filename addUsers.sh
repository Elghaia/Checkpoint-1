#!/bin/bash

#Verification de la présence d'arguments
check_argument()
{
if [ -z "$1" ] 
then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi
}

#Fonction pour vérifier que l'utilisateur n'existe pas déjà
check_user ()
{
 if grep -w "$1" /etc/passwd > /dev/null
 then
        echo "L'utilisateur $1 existe déjà"
        return 1  # L'utilisateur existe
 fi
    return 0  # L'utilisateur n'existe pas
}


#Fonction pour créer un utilisateur 
create_user ()
{
    sudo useradd "$1"
    }



#Vérification de la création de l'utilisateur
verif()
{
 if grep -w "$1" /etc/passwd
 then
        echo "L'utilisateur $1 a été créé"   # le compte a été créé
        exit 0
    else
        echo "Erreur à la création de l'utilisateur $1"  # le compte n'a pas été créé
        exit 1  # Sortir du script si la création échoue
 fi
 }

# Vérification des arguments
check_argument "$@"

# Boucle pour traiter chaque argument
for username in "$@"     #permet de déclarer la variable $username
do
    if check_user "$username"
    then
        create_user "$username"
        verif "$username"
    else
        continue 
    fi
done


