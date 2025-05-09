#!/bin/bash
# SUV Crawler - Sicherer Betrieb im Benutzerverzeichnis ~/suv_crawler
# Letzte Aktualisierung: automatisch generiert

CRAWLER_DIR="$HOME/suv_crawler"
LOGFILE="$CRAWLER_DIR/suv_crawler.log"
TARGET_DIR="$HOME/www/AI/data"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$DATE] 🔄 Starte SUV-Daten-Crawler..." >> "$LOGFILE"

# Python-Skript ausführen
/usr/bin/python3 "$CRAWLER_DIR/suv_crawler.py" >> "$LOGFILE" 2>&1

# Kopieren der Ergebnisdateien ins Webverzeichnis
if [ -f "$CRAWLER_DIR/angebote.json" ] && [ -f "$CRAWLER_DIR/admin_dashboard.json" ]; then
    echo "[$DATE] 📁 Kopiere JSON-Dateien nach $TARGET_DIR" >> "$LOGFILE"
    mkdir -p "$TARGET_DIR"
    cp "$CRAWLER_DIR/angebote.json" "$TARGET_DIR/angebote.json"
    cp "$CRAWLER_DIR/admin_dashboard.json" "$TARGET_DIR/admin_dashboard.json"
    echo "[$DATE] ✅ Datenübertragung erfolgreich." >> "$LOGFILE"
else
    echo "[$DATE] ❌ Fehler: JSON-Dateien nicht gefunden!" >> "$LOGFILE"
fi
