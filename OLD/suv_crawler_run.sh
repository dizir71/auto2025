#!/bin/bash
echo "[`date '+%Y-%m-%d %H:%M:%S'`] 🔄 Starte SUV-Live-Crawler..."

# Beispiel: Livefeed URL (wird beim Deployment ersetzt durch echte API oder Scraper)
LIVEFEED_URL="https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/data/fine_tune_example_data.json"
ZIEL_DATEI="/var/www/AI/data/angebote.json"

# Download simulieren (für echten Einsatz: curl -s oder wget)
curl -s "$LIVEFEED_URL" -o "$ZIEL_DATEI"

if [ $? -eq 0 ]; then
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] ✅ Daten erfolgreich aktualisiert." >> /var/home/schweizerhof-am-see_at/suv_crawler/suv_crawler.log
else
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] ❌ Fehler beim Aktualisieren der Daten." >> /var/home/schweizerhof-am-see_at/suv_crawler/suv_crawler.log
fi
