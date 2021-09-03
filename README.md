# Application Python pour Jenkins

## description

C'est un simple projet pour apprendre Jenkins et découvrir les tests unitaires

## prérequis

1. docker
2. git
3. python >= 3.9 & < 4.
4. venv avec python
5. jenkins

## démarrage

1. Créer l'environnement virtuuel en ouvrant la console, à la racine du projet : 

    ```shell
    # venv :  est un programme en Python 
    # pour créer un copie du répertoire "python" dans notre projet
    
    # .venv : répertoire de destination de notre copie. C'est lui qui contiendra
    # les dépendances installées avec "pip install"
    python -m venv .venv

    # activation de l'environnement virtuel en PowerShell
    .\.venv\Scripts\Activate.ps1
    # activation de l'environnement virtuel en cmd
    .\.venv\Scripts\activate.bat
    # activation de l'environnement virtuel en shell/bash/bsh
    shell ./.venv/Scripts/activate

    # installation des dépendances du projet depuis le fichier requirements.txt
    pip install -r .\requirements.txt
    ```

## notes
