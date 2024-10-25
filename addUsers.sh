#!/bin/bash

#Verification de la présence d'arguments
check_argument()
{
if [ -z "$1" ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi
}

#Fonction pour vérifier que l'utilisateur n'existe pas déjà
check_user ()
{
if cat /etc/passwd | grep $username
        echo "L'utilisateur $username existe déjà"
fi
}


#Fonction pour créer un utilisateur 
create_user ()
{
    sudo useradd "$1"
    }



#Vérification de la création de l'utilisateur
verif()
{
        if cat /etc/passwd | grep $username
then
  # le compte a été crée
        echo "L'utilisateur $username a été crée" 
        exit 0
else
        echo "Erreur à la création de l'utilisateur $username"
        exit 1
fi
}




# Boucle pour traiter chaque argument
for username in "$@"; #permet de déclarer la variable $username
do
    if check_argument "$username";
        then
    else
        create_user "$username"
        verif "$username"
    fi
done


