#!/bin/bash
cd "$(dirname "$0")/AI"
python3 -m http.server 8000 > /dev/null 2>&1 &
echo "✅ Webserver läuft unter http://localhost:8000/"
