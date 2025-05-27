#!/usr/bin/env python3
import json
from datetime import datetime
from mobile_de_scraper import scrape_mobile_de
from autoscout24_scraper import scrape_autoscout24

def main():
    daten = []
    daten.extend(scrape_mobile_de())
    daten.extend(scrape_autoscout24())

    dashboard = {
        "last_updated": datetime.utcnow().isoformat() + "Z",
        "sources_checked": ["mobile.de", "autoscout24.de"],
        "status": "🟢 Echtzeitdaten geladen",
        "admin_mode_enabled": True
    }

    with open("angebote.json", "w") as f:
        json.dump(daten, f, indent=2)
    with open("admin_dashboard.json", "w") as f:
        json.dump(dashboard, f, indent=2)
    print("✅ SUV-Crawler hat echte Daten verarbeitet.")

if __name__ == "__main__":
    main()
