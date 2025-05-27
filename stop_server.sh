#!/bin/bash

PORT=8080

echo "⛔ Versuche Webserver auf Port $PORT zu stoppen …"

PID=$(lsof -ti tcp:$PORT)

if [ -n "$PID" ]; then
  kill "$PID"
  echo "✅ Webserver (PID $PID) wurde gestoppt."
else
  echo "ℹ️ Kein laufender Webserver auf Port $PORT gefunden."
fi
