#!/bin/bash

# Projektverzeichnis setzen
cd "$(dirname "$0")"

# Port setzen
PORT=8080

# Prüfen, ob der Port bereits verwendet wird
if lsof -i :$PORT &>/dev/null; then
  echo "❌ Port $PORT ist bereits in Verwendung. Bitte beende den anderen Server oder wähle einen anderen Port."
  exit 1
fi

# Webserver im Hintergrund starten
echo "🚀 Starte lokalen Webserver im Hintergrund auf http://localhost:$PORT ..."
nohup python3 -m http.server $PORT > server.log 2>&1 &

echo "ℹ️ Server läuft. Log-Datei: server.log"
