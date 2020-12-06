$(function () {

  const parseLabels = labels => {
    labels = labels.slice(1,-1);
    labels = labels.split(',')
    labels = labels.filter((a,i)=>i%2===1).map(a=>a.trim());
    return labels;
  }

  const parseData = data => {
    data = data.slice(1, -1);
    data = data.split(',').map(a => parseInt(a))
    return data;
  }

  var ctx = document.getElementById('page-views');
  let labels = parseLabels(ctx.dataset.labels)
  
  let data = parseData(ctx.dataset.data);

  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Page Views',
            data: data,
            borderWidth: 1
        }]
    },
  });

  ctx = document.getElementById('unique-page-views');
  labels = parseLabels(ctx.dataset.labels)
  
  data = parseData(ctx.dataset.data);

  myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Unique Page Views',
            data: data,
            borderWidth: 1
        }]
    },
  });
})


