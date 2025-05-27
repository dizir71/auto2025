
document.getElementById("disableSampleBtn").addEventListener("click", () => {
  localStorage.setItem("useSampleData", "false");
  location.reload();
});
const useSample = localStorage.getItem("useSampleData") !== "false";
const path = useSample ? "dashboard/data/angebote.json" : "../suv_crawler/angebote.json";
fetch(path).then(r => r.json()).then(d => {
  const c = document.getElementById("angebote-liste");
  d.forEach(a => {
    const el = document.createElement("div");
    el.className = "card";
    el.textContent = `${a.marke} ${a.modell} – ${a.preis}`;
    c.appendChild(el);
  });
}).catch(() => document.getElementById("error-box").style.display = "block");
