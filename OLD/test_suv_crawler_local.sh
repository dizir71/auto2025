#!/bin/bash
echo "[TEST] Prüfe lokalen SUV-Crawler..."
chmod +x suv_crawler.sh
./suv_crawler.sh
if [[ -f "angebote.json" ]]; then
  echo "[OK] angebote.json vorhanden:"
  head -n 10 angebote.json
else
  echo "[FAIL] angebote.json fehlt!"
fi
