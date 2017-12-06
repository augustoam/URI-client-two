$(document).on('turbolinks:load', function() {
  title.innerHTML = "Timer client one";

  setInterval('publish_time_mqtt()', 10000);
  $.get({
    url: "time/get_time"
  }).done(function(data) {

    var dateSplit = data.split('T')[1];
    var horaSplit = dateSplit.split(':');

    var hora = horaSplit[0];
    var min = horaSplit[1];
    var sec = horaSplit[2].split('.')[0]

    var seconds = (((parseInt(hora) * 3600) + parseInt(min * 60)) + parseInt(sec));

    incrementaSegundo(seconds)
  });


})

function incrementaSegundo(seconds) {
  interval = setInterval(increment, 1000);

  function increment() {
    seconds = parseInt(seconds) + 1;

    var date = new Date(1970, 0, 1);
    date.setSeconds(seconds);
    var result = date.toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
    document.getElementById("time").innerHTML = result;
  }
}

function publish_time_mqtt() {

  var thisTime = $('#time').get(0).textContent;
  var vData = {
    time: thisTime
  };

  $.post({
    data: vData,
    url: "time/publish_time_mqtt"
  }).done(function(data) {

  });
}
