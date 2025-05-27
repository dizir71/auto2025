fetch('angebote.json')
  .then(res => res.json())
  .then(data => console.log("Angebote geladen:", data))
  .catch(err => console.error("Fehler beim Laden:", err));