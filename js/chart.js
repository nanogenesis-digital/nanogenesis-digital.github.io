async function documentLoader() {

  const [fileList, xslString] = await Promise.all([
    fetch("sessions.json").then(r => r.json()),
    fetch("../../xsl/charts.xsl").then(r => r.text())
  ]);

  const parser = new DOMParser();
  const xslDoc = parser.parseFromString(xslString, "text/xml");

  const xsltProcessor = new XSLTProcessor();
  xsltProcessor.importStylesheet(xslDoc);

  const container = document.getElementById("charts");
  container.innerHTML = "";

  for (const file of fileList) {
    const xmlString = await fetch(file).then(r => r.text());
    const xmlDoc = parser.parseFromString(xmlString, "text/xml");

    const fragment = xsltProcessor.transformToFragment(xmlDoc, document);

    const wrapper = document.createElement("div");
    wrapper.className = "chart-wrapper";
    wrapper.appendChild(fragment);

    container.appendChild(wrapper);
  }

  initCharts();
}


function initCharts() {

  document.querySelectorAll(".session-chart").forEach(section => {

    const categories = [
      { label: "new text", key: "addNt", color: "#843371" },
      { label: "continuations", key: "modContinue", color: "#ff9900" },
      { label: "typos (deletions)", key: "delTypo", color: "#875531" },
      { label: "typos (additions)", key: "addTypo", color: "#BE7C4D" },
      { label: "contextual deletions", key: "delContext", color: "#B20D30" },
      { label: "contextual additions", key: "addContext", color: "#04724D" },
      { label: "pre-contextual deletions", key: "delPrecontext", color: "#F35376" },
      { label: "pre-contextual additions", key: "addPrecontext", color: "#7FB069" },
      { label: "translocations", key: "addTranslocation", color: "#377495" }
    ];


    const labels = [];
    const values = [];
    const colors = [];

    categories.forEach(cat => {
      const value = Number(section.dataset[cat.key] || 0);
      if (value > 0) {
        labels.push(cat.label);
        values.push(value);
        colors.push(cat.color);
      }
    });


    const canvas = section.querySelector("canvas");

    new Chart(canvas.getContext("2d"), {
      type: "bar",
      data: {
        labels: labels,
        datasets: [{
          label: "Count",
          data: values,
          backgroundColor: colors
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: false },
          title: {
            display: true,
            text: "Types of Writing Actions"
          }
        },
        scales: {
          x: {
            ticks: {
              autoSkip: false,
              maxRotation: 45,
              minRotation: 30
            }
          },
          y: {
            beginAtZero: true,
            precision: 0
          }
        }
      }

    });
  });
}


// Run after DOM is ready
document.addEventListener("DOMContentLoaded", documentLoader);
