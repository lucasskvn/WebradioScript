# 🎵 WebradioScript — Script de Webradio

<div align="center">
  <img src="https://img.shields.io/badge/Liquidsoap-Yes-blue?style=for-the-badge" alt="Liquidsoap">
  <img src="https://img.shields.io/badge/Icecast-2-green?style=for-the-badge" alt="Icecast">
  <img src="https://img.shields.io/badge/Shell-Bash-green?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Bash">
</div>

<br>

**WebradioScript** est un script rapide pour mettre en place une webradio avec **Liquidsoap** et **Icecast2**. Il inclut un fichier de configuration préconfiguré pour démarrer rapidement.

---

## ✨ Fonctionnalités

- 🎵 **Streaming audio** — Diffusion de musique en continu
- 🔧 **Configuration facile** — Fichier préconfiguré inclus
- 🚀 **Installation rapide** — Script d'installation automatique
- 🎨 **Personnalisation** — Configuration modulaire
- 📡 **Multi-source** — Support de plusieurs sources audio
- 🔊 **Qualité audio** — Configuration optimale pour le streaming

---

## 🚀 Installation

### Prérequis

- Linux (Ubuntu/Debian recommandé)
- Liquidsoap
- Icecast2
- Bash

### Installation automatique

```bash
# Cloner le repository
git clone https://github.com/lucasskvn/WebradioScript.git
cd WebradioScript

# Rendre le script exécutable
chmod +x radio

# Lancer l'installation
./radio install
```

### Installation manuelle

```bash
# Installer Liquidsoap
sudo apt-get install liquidsoap

# Installer Icecast2
sudo apt-get install icecast2

# Configurer Icecast2
sudo nano /etc/icecast2/icecast.xml

# Configurer Liquidsoap
nano radio.liq
```

---

## 📖 Utilisation

### Démarrer la webradio

```bash
# Démarrer avec la configuration par défaut
./radio start

# Démarrer avec une configuration personnalisée
./radio start --config custom.liq

# Démarrer en arrière-plan
./radio start --daemon
```

### Arrêter la webradio

```bash
# Arrêter proprement
./radio stop

# Forcer l'arrêt
./radio kill
```

### Vérifier le statut

```bash
# Vérifier si la webradio tourne
./radio status

# Voir les logs
./radio logs
```

---

## ⚙️ Configuration

### Fichier de configuration principal

Le fichier `radio.liq` contient la configuration de la webradio :

```liquidsoap
# Source audio
playlist = playlist(mode="random", "/chemin/vers/musique")

# Output Icecast
output.icecast(
  %mp3(bitrate=128),
  host="localhost",
  port=8000,
  password="hackme",
  mount="/radio",
  name="Ma Webradio",
  description="Une super webradio",
  genre="Pop",
  url="http://localhost:8000",
  playlist
)
```

### Configuration Icecast

Le fichier `/etc/icecast2/icecast.xml` configure le serveur Icecast :

```xml
<icecast>
  <location>Mon Pays</location>
  <admin>admin@localhost</admin>
  
  <limits>
    <clients>100</clients>
    <sources>2</sources>
    <queue-size>524288</queue-size>
  </limits>
  
  <authentication>
    <source-password>hackme</source-password>
    <relay-password>hackme</relay-password>
    <admin-user>admin</admin-user>
    <admin-password>hackme</admin-password>
  </authentication>
  
  <hostname>localhost</hostname>
  
  <listen-socket>
    <port>8000</port>
  </listen-socket>
</icecast>
```

---

## 🎵 Sources audio

### Playlist

```liquidsoap
# Playlist aléatoire
playlist = playlist(mode="random", "/chemin/vers/musique")

# Playlist séquentielle
playlist = playlist(mode="normal", "/chemin/vers/musique")

# Playlist avec lecture en boucle
playlist = playlist(mode="random", "/chemin/vers/musique", reload=3600)
```

### Live

```liquidsoap
# Source live (microphone)
live = input.alsa(device="default")

# Mélanger playlist et live
radio = fallback([live, playlist])
```

### Stream

```liquidsoap
# Stream distant
stream = input.http("http://example.com/stream")

# Mélanger avec la playlist
radio = fallback([stream, playlist])
```

---

## 📡 Accès à la webradio

### Depuis un navigateur

Ouvrez votre navigateur et allez sur :

```
http://localhost:8000/radio
```

### Depuis un lecteur audio

Utilisez l'URL suivante dans votre lecteur audio préféré :

```
http://localhost:8000/radio.m3u
```

### Depuis VLC

1. Ouvrez VLC
2. Allez dans **Média** → **Ouvrir un flux réseau**
3. Entrez l'URL : `http://localhost:8000/radio`
4. Cliquez sur **Lecture**

---

## 🔧 Dépannage

### Icecast ne démarre pas

```bash
# Vérifier les logs
sudo tail -f /var/log/icecast2/error.log

# Vérifier la configuration
sudo icecast2 -c /etc/icecast2/icecast.xml
```

### Liquidsoap ne se connecte pas

```bash
# Vérifier les logs
tail -f /var/log/liquidsoap/radio.log

# Tester la configuration
liquidsoap -c radio.liq
```

### Pas de son

```bash
# Vérifier le volume
alsamixer

# Vérifier les périphériques audio
aplay -l
```

---

## 📝 Notes

- Le script est conçu pour **Ubuntu/Debian** mais peut être adapté pour d'autres distributions
- Pensez à changer les mots de passe par défaut dans la configuration
- Pour une utilisation en production, configurez HTTPS et un nom de domaine

---

## 👤 Auteur

**Lucas Kvn** — [GitHub](https://github.com/lucasskvn) — [lucasskvn.fr](https://lucasskvn.fr)

---

<div align="center">
  <sub>🎵 Fait avec Liquidsoap et Icecast</sub>
</div>
