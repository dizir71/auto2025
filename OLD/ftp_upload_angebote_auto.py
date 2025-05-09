
from ftplib import FTP
import requests

# === KONFIGURATION ===
FTP_HOST = "host25.ssl-net.net"
FTP_PORT = 21
FTP_USER = "schweizerhof-am-see_at_ai"
FTP_PASS = "HIER_DEIN_PASSWORT_EINFÜGEN"
REMOTE_DIR = "/www/AI/"
LOCAL_FILE = "angebote.json"
LIVE_FEED_URL = "https://example.com/angebote.json"  # <== HIER SPÄTER LIVE-FEED-URL EINFÜGEN

# === Schritt 1: JSON herunterladen ===
def download_json():
    try:
        print(f"🔄 Lade JSON-Datei von {LIVE_FEED_URL}...")
        r = requests.get(LIVE_FEED_URL)
        r.raise_for_status()
        with open(LOCAL_FILE, "w", encoding="utf-8") as f:
            f.write(r.text)
        print("✔ JSON erfolgreich gespeichert.")
    except Exception as e:
        print(f"❌ Fehler beim Herunterladen: {e}")

# === Schritt 2: FTP Upload ===
def upload_file():
    try:
        ftp = FTP()
        ftp.connect(FTP_HOST, FTP_PORT)
        ftp.login(FTP_USER, FTP_PASS)
        ftp.cwd(REMOTE_DIR)

        with open(LOCAL_FILE, "rb") as f:
            ftp.storbinary(f"STOR {LOCAL_FILE}", f)

        ftp.quit()
        print(f"✔ Datei '{LOCAL_FILE}' erfolgreich hochgeladen.")
    except Exception as e:
        print(f"❌ Fehler beim Hochladen: {e}")

if __name__ == "__main__":
    download_json()
    upload_file()
