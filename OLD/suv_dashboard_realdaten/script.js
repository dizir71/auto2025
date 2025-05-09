fetch('../data/angebote.json')
  .then(response => response.json())
  .then(data => {
    const container = document.getElementById('fahrzeuge');
    if (!data || data.length === 0) {
      container.innerHTML = "<p>Keine Fahrzeuge gefunden.</p>";
      return;
    }
    const html = data.map(auto => `
      <div class="card">
        <h2>${auto.fahrzeug}</h2>
        <p><strong>Preis:</strong> €${auto.preis}</p>
        <p><strong>EZ:</strong> ${auto.ez}</p>
        <p><strong>KM:</strong> ${auto.km}</p>
        <p><strong>Antrieb:</strong> ${auto.antrieb}</p>
        <p><strong>Bewertung:</strong> ${auto.bewertung}</p>
        <a href="${auto.link}" target="_blank">Angebot ansehen</a>
      </div>
    `).join('');
    container.innerHTML = html;
  })
  .catch(err => {
    document.getElementById('fahrzeuge').innerHTML = '<p>Fehler beim Laden der Daten.</p>';
    console.error(err);
  });
