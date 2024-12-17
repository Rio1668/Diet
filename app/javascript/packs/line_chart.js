document.addEventListener("turbolinks:load", () => {
  async function getData() {
    const ctx = document.getElementById('myChart');
    const targetId = ctx.dataset.target;
    const url = `/posts/${targetId}.json`;
  
    try {
      const response = await fetch(url);
  
      if (!response.ok) {
        throw new Error(`response status: ${response.status}`);
      }
  
      const json = await response.json();
      console.log(json);
      const labels = json.map((o) => { 
        const date = new Date(o.start_time);
        return date.toLocaleDateString();
      })
      const data = json.map((o) => o.weight )
      new Chart(ctx, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: "直近の体重",
            data: data,
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    } catch (error) {
      console.error(error.message);
    }
  }
  getData()
})