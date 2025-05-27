#!/bin/bash

# Zielverzeichnis
cd ~/Desktop/GitHub/auto2025 || exit 1

# Name der ZIP-Datei
ZIP_NAME="auto2025_full_$(date +%Y-%m-%d_%H-%M).zip"

# Verzeichnisse und Dateien einpacken
zip -r "$ZIP_NAME" \
  AI/ \
  data/ \
  suv_crawler/ \
  start_server.sh \
  stop_server.sh \
  server.log \
  server_cron.log \
  status.json

# Ausgabe
echo "✅ ZIP-Datei erstellt: $ZIP_NAME"
