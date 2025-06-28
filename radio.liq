music_dir = "music"

# Playlist
base_playlist = playlist(music_dir, reload_mode="watch", id="music_playlist")

# Lecture aléatoire + crossfade
music_source = crossfade(width=2.0, random([base_playlist]))

# Fallback
fallback_source = fallback(track_sensitive=false, [music_source, blank(duration=5.0)])

# Serveur telnet
settings.server.telnet.set(true)
settings.server.telnet.port.set(1234)
settings.init.allow_root.set(true)

# Variables d'environnement
host = getenv("ICECAST_HOST")
password = getenv("ICECAST_PASSWORD")
name = getenv("ICECAST_NAME")
desc = getenv("ICECAST_DESC")

# Sortie Icecast
output.icecast(%mp3,
  host = host,
  port = 8000,
  password = password,
  mount = "stream.mp3",
  name = name,
  description = desc,
  genre = "Mix",
  url = "http://#{host}:8000",
  fallback_source
)
