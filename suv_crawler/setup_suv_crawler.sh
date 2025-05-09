#!/bin/bash

echo "🚀 Starte Setup für SUV Crawler auf dem Server..."

# Schritt 1: Prüfen ob Python installiert ist
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 ist nicht installiert. Bitte zuerst Python installieren."
    exit 1
fi

# Schritt 2: Ordnerstruktur vorbereiten
mkdir -p ~/crawler_ai/logs
cd ~/crawler_ai || exit

# Schritt 3: Crawler-Skript herunterladen
curl -s -o suv_crawler.py https://schweizerhof-am-see.at/AI/scripts/suv_crawler_full.py

# Schritt 4: Erstelle Logdatei
touch logs/crawler.log

# Schritt 5: Cronjob einrichten (alle 10 Minuten)
(crontab -l 2>/dev/null; echo "*/10 * * * * python3 ~/crawler_ai/suv_crawler.py >> ~/crawler_ai/logs/crawler.log 2>&1") | crontab -

echo "✅ Setup abgeschlossen. Crawler läuft alle 10 Minuten."
