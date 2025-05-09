const root = document.getElementById("root");

async function render() {
  const res = await fetch("https://schweizerhof-am-see.at/AI/angebote.json");
  const data = await res.json();
  const cleaned = data.filter(e => e && e.hersteller && !/test|beispiel/i.test(e.titel || ""));
  const sorted = cleaned.sort((a, b) => b.bewertung - a.bewertung).slice(0, 5);
  root.innerHTML = "<h1>SUV Dashboard</h1>" + sorted.map(a => `
    <div style='margin: 1em 0; padding: 1em; background: #fff; border-radius: 8px; box-shadow: 0 1px 4px rgba(0,0,0,0.1)'>
      <b>${a.hersteller}</b><br/>
      Baujahr: ${a.baujahr}<br/>
      Preis: ${a.preis.toLocaleString()} €<br/>
      Bewertung: ${a.bewertung} / 10
    </div>
  `).join('');
}

render();
