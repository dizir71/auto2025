
document.getElementById("enableSampleBtn").addEventListener("click", () => {
  localStorage.setItem("useSampleData", "true");
  location.reload();
});
document.getElementById("disableSampleBtn").addEventListener("click", () => {
  localStorage.setItem("useSampleData", "false");
  location.reload();
});

const useSample = localStorage.getItem("useSampleData") !== "false";
const angebotePath = useSample ? "dashboard/data/angebote.json" : "dashboard/data/angebote_live.json";

fetch(angebotePath).then(r => r.json()).then(data => {
  const container = document.getElementById("angebote-liste");
  container.innerHTML = '';
  data.forEach(auto => {
    const el = document.createElement("div");
    el.className = "card";
    el.textContent = `${auto.marke} ${auto.modell} – ${auto.preis}`;
    container.appendChild(el);
  });
}).catch(() => document.getElementById("error-box").style.display = "block");
