#!/bin/bash
HOST=host25.duckdns.org
PORT=2222
echo "[CHECK] Verbindung zu $HOST:$PORT"
IP=$(dig +short $HOST | tail -n1)
[[ -z "$IP" ]] && echo "[FAIL] DNS nicht auflösbar" && exit 1
echo "[OK] DNS $IP"
nc -z -w3 $HOST $PORT && echo "[OK] Port offen" || echo "[FAIL] Port blockiert"
ssh -o BatchMode=yes -o ConnectTimeout=5 -p $PORT $HOST exit && echo "[OK] SSH Verbindung möglich" || echo "[FAIL] SSH fehlgeschlagen"
