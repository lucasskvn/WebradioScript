#!/bin/bash

# Installer les dépendances nécessaires
sudo apt update
sudo apt install liquidsoap wget icecast2 -y

# Rendre le script de démarrage exécutable
chmod +x start.sh

# Créer les dossiers nécessaires
mkdir music

# Lancer liquidsoap avec le script radio.liq
./start.sh

# Afficher l'adresse d'accès
echo "Serveur lancé. Accès au flux : http://[IP_ADDRESS]:8000"
