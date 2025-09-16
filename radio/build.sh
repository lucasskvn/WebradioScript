#!/bin/bash

sudo apt update
sudo apt install liquidsoap wget icecast2 -y
chmod +x start.sh
mkdir music
./start.sh
echo "Serveur lancé. Accès au flux : http://[IP_ADDRESS]:8000"
