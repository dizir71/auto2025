#!/bin/bash
cd "$(dirname "$0")"
echo "[`date '+%Y-%m-%d %H:%M:%S'`] 🔄 Starte SUV-Crawler..." >> suv_crawler.log
python3 suv_crawler.py >> suv_crawler.log 2>&1
echo "[`date '+%Y-%m-%d %H:%M:%S'`] ✅ SUV-Crawler abgeschlossen." >> suv_crawler.log
