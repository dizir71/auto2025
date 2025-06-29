import json
print("[INFO] Generiere Angebotsliste...")
data = [
    {"fahrzeug": "Porsche Cayenne", "preis": 28900, "ez": "2019-04", "km": 76800, "antrieb": "Benzin", "bewertung": 8.7, "link": "https://example.com/angebot1"},
    {"fahrzeug": "Mercedes ML 350", "preis": 23900, "ez": "2016-08", "km": 112000, "antrieb": "Diesel", "bewertung": 8.1, "link": "https://example.com/angebot2"}
]
with open("angebote.json", "w") as f:
    json.dump(data, f, indent=2)
print("[OK] angebote.json geschrieben.")
