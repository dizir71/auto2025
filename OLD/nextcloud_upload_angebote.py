import requests

# === KONFIGURATION ===
NEXTCLOUD_URL = "https://host25.ssl-net.net/schweizerhof-am-see_at/NC/remote.php/dav/files/aiapi/AI/angebote.json"
NEXTCLOUD_USER = "aiapi"
NEXTCLOUD_PASS = "wumqy9-cIfpug-vihbyd"
LIVE_FEED_URL = "https://schweizerhof-am-see.at/AI/angebote.json"

def upload_to_nextcloud():
    try:
        print("🔄 Lade Livefeed herunter...")
        response = requests.get(LIVE_FEED_URL)
        response.raise_for_status()

        print("📤 Lade Datei in Nextcloud hoch...")
        upload = requests.put(
            NEXTCLOUD_URL,
            data=response.content,
            auth=(NEXTCLOUD_USER, NEXTCLOUD_PASS)
        )

        if upload.status_code in (200, 201, 204):
            print("✅ Upload erfolgreich.")
        else:
            print(f"❌ Fehler beim Upload: Status {upload.status_code}")
    except Exception as e:
        print(f"❌ Fehler: {e}")

if __name__ == "__main__":
    upload_to_nextcloud()
