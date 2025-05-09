#!/bin/bash

echo "🔍 Verfügbare SSH Public Keys:"
for key in ~/.ssh/*.pub; do
  echo "→ $key:"
  cat "$key"
  echo ""
done

echo "--------------------------------------------"
echo "📝 Deine aktuelle ~/.ssh/config für 'host25':"
grep -A 4 "Host host25" ~/.ssh/config
echo "--------------------------------------------"

read -p "❓ Möchtest du automatisch den passenden Key eintragen? (y/n): " confirm
if [[ "$confirm" == "y" ]]; then
  read -p "⚙️  Welchen Keypfad möchtest du verwenden? (z. B. ~/.ssh/id_ed25519): " keyfile
  if [[ -f "$keyfile" ]]; then
    cp ~/.ssh/config ~/.ssh/config.bak
    sed -i '' '/Host host25/,+4d' ~/.ssh/config
    echo -e "\nHost host25\n  HostName host25.duckdns.org\n  User schweizerhof-am-see_at\n  Port 2222\n  IdentityFile $keyfile" >> ~/.ssh/config
    echo "✅ Konfiguration aktualisiert. Teste nun: ssh host25"
  else
    echo "❌ Datei nicht gefunden: $keyfile"
  fi
else
  echo "⏹️ Abgebrochen."
fi
