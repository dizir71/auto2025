from ftplib import FTP_TLS
import requests
from io import BytesIO

# === KONFIGURATION ===
FTP_HOST = "host25.ssl-net.net"
FTP_USER = "schweizerhof-am-see_at_ai"
FTP_PASS = "wumqy9-cIfpug-vihbyd"
FTP_PATH = "/NC/AI/angebote.json"

LIVE_FEED_URL = "https://schweizerhof-am-see.at/AI/angebote.json"

def upload_to_ftp():
    try:
        print("🔄 Lade Livefeed herunter...")
        response = requests.get(LIVE_FEED_URL)
        response.raise_for_status()
        data = BytesIO(response.content)

        print("📤 Stelle FTP-Verbindung her...")
        ftps = FTP_TLS(FTP_HOST)
        ftps.login(FTP_USER, FTP_PASS)
        ftps.prot_p()
        ftps.cwd("/")

        # Verzeichnis wechseln oder erstellen
        dirs = FTP_PATH.strip("/").split("/")[:-1]
        for d in dirs:
            try:
                ftps.cwd(d)
            except:
                ftps.mkd(d)
                ftps.cwd(d)

        filename = FTP_PATH.strip("/").split("/")[-1]
        print(f"📁 Lade Datei hoch als {filename}...")
        ftps.storbinary(f"STOR {filename}", data)
        ftps.quit()

        print("✅ Upload erfolgreich.")
    except Exception as e:
        print(f"❌ Fehler: {e}")

if __name__ == "__main__":
    upload_to_ftp()
