#!/usr/bin/env python3
import json
from datetime import datetime

# Testdaten erzeugen
angebote = [
    {
        "fahrzeug": "Porsche Cayenne",
        "preis": 28900,
        "ez": "2019-04",
        "km": 76800,
        "antrieb": "Benzin",
        "bewertung": 8.7,
        "link": "https://example.com/angebot1"
    },
    {
        "fahrzeug": "Mercedes ML 350",
        "preis": 23900,
        "ez": "2016-08",
        "km": 112000,
        "antrieb": "Diesel",
        "bewertung": 8.1,
        "link": "https://example.com/angebot2"
    }
]

dashboard = {
    "last_updated": datetime.utcnow().isoformat() + "Z",
    "sources_checked": ["mobile.de", "autoscout24.de", "willhaben.at"],
    "status": "🟢 Daten erfolgreich geladen",
    "admin_mode_enabled": True
}

# In Dateien schreiben
with open("angebote.json", "w") as f:
    json.dump(angebote, f, indent=2)

with open("admin_dashboard.json", "w") as f:
    json.dump(dashboard, f, indent=2)

print("✅ SUV-Crawler-Dummy-Daten erfolgreich erstellt.")
