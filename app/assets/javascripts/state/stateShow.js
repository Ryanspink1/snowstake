var state_name = window.location.href.substr(this.location.href.lastIndexOf('/') + 1)
var buttons = [
  ["Radar", `<img id="state-index-item-image" src="https://s3-us-west-2.amazonaws.com/snowstake/states/state_show/radar-31-256x256.png" class="img-thumbnail">`, "$('#radar-modal').modal('show')"],
  ["Snow Stakes", `<img id="state-index-item-image" src="https://s3-us-west-2.amazonaws.com/snowstake/states/state_show/snow_flake.png" class="img-thumbnail">`, "$('#all-snow-stakes-modal').modal('show')"],
  ["Snowfall", `<img id="state-index-item-image" src="https://s3-us-west-2.amazonaws.com/snowstake/states/state_show/weather.png" class="img-thumbnail">`, "$('#quick-forecasts-modal').modal('show')"],
  ["DOT Twitter", `<img id="state-index-item-image" src="https://s3-us-west-2.amazonaws.com/snowstake/states/state_show/car_vector.png" class="img-thumbnail">`, "$('#transportation-twitter-modal').modal('show')"],
  ["Resorts", `<img id="state-index-item-image" src="https://s3-us-west-2.amazonaws.com/snowstake/states/state_show/skiier.png" class="img-thumbnail">`, "$('#resorts-modal').modal('show')"]
]

function getResorts(){
  $.ajax({
    url: `/api/v1/states/${state_name}`,
    method:"GET"
  }).then(
    function(data){
      populateStateShow(data[`${state_name}`])
    }
  )
}

function populateStateShow(data){
  populateStateShowHeader(state_name)
  populateButtons()
  populateModals(data)
}

function populateStateShowHeader(state_name){
  $("#state-show-message").append(
    `${state_name}`
  )
}

function populateButtons(){
  buttons.forEach(function(button){
    $('#state-directory-container').append(
      `
      <div class="state-directory-item" onclick=${button[2]}>
        <div class="state-directory-item-header">
          <span class="image-text">
            ${button[0]}
          </span>
        </div>
        <div class="state-directory-item-picture">
          ${button[1]}
        </div>
      </div>
      `
    )
  })

}

function populateModals(data){
  populateRadarModal(data.radar)
  populateAllSnowStakesModal(data.resorts)
  populateQuickForecastsModal(data.resorts)
  populateTransportationTwitterModal(data.twitter)
  populateResortsModal(data.resorts)
}

function populateRadarModal(radar_url){
  $("#radar-modal-body").append(
    `<div id="radar-container">
       <img id="radar-cover-image" src="${radar_url}?${Math.floor((Math.random() * 1000) + 1).toString()}" class="img-thumbnail" style="width:90vw;">
     </div>
    `
  )
}

function populateAllSnowStakesModal(data){
  data.forEach(function(resort){
    $("#all-snow-stakes-modal-body").append(
      `
        <h3 style="background-color:#000066;color:white; text-align:center;">${resort.name}</h3>
        <img id="event-cover-image" src="${resort.snowstake_url}?${Math.floor((Math.random() * 1000) + 1).toString()}" class="img-thumbnail" style="width:90vw;">
        <br>
        <br>
      `
    )
  })
}

function populateQuickForecastsModal(forecasts){
  populateQuickForecastsModalHeader(forecasts)
  populateQuickForecastsModalBody(forecasts)
}
function populateQuickForecastsModalHeader(forecasts){
  $("#quick-forecasts-table-header").append(
    `
      <th> ${forecasts[0].period_one_dow} </th>
      <th> ${forecasts[0].period_one_dow} Night</th>
      <th> ${forecasts[0].period_two_dow} </th>
      <th> ${forecasts[0].period_two_dow} Night</th>
      <th> ${forecasts[0].period_three_dow} </th>
      <th> ${forecasts[0].period_three_dow} Night</th>
      <th> ${forecasts[0].period_four_dow} </th>
      <th> ${forecasts[0].period_four_dow} Night</th>
      <th> ${forecasts[0].period_five_dow} </th>
      <th> ${forecasts[0].period_five_dow} Night</th>
    `
  )
}

function populateQuickForecastsModalBody(resorts){
  resorts.forEach(function(resort){
    $("#quick-forecasts-table-body").append(
      `
      <tr>
        <td><strong>${resort.name}</strong></td>
        <td>${resort.period_one_day_snow}"</td>
        <td>${resort.period_one_night_snow}"</td>
        <td>${resort.period_two_day_snow}"</td>
        <td>${resort.period_two_night_snow}"</td>
        <td>${resort.period_three_day_snow}"</td>
        <td>${resort.period_three_night_snow}"</td>
        <td>${resort.period_four_day_snow}"</td>
        <td>${resort.period_four_night_snow}"</td>
        <td>${resort.period_five_day_snow}"</td>
        <td>${resort.period_five_night_snow}"</td>
      </tr>
      `
    )
  })

}

function populateTransportationTwitterModal(twitter_url){
  $('#transportation-twitter-modal-body').append(
    `
      <div id="transportation-twitter-container">
        <a class="twitter-timeline" href=${twitter_url}>Tweets</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      </div>
    `
  )
}

function populateResortsModal(resorts){
  resorts.forEach(function(resort, index){
    resort_href = resort.name.replace(/\s+/g, '');
    $('#resorts-modal-body').append(
      `
      <div class="resorts-instance">
        <div class="resorts-instance-header">
          <p class="trigger-${index}"><a>${resort.name}</a></p>
        </div>
        <div class="toggle_container ${index}">
          <div class="block" id="resorts-instance-body">
            <div class="container" id="resort-modal-header-container">
              <div class="row justify-content-center">
                <div class="col">
                </div>
                <div class="col" id="resort-modal-header-column">
                  <div class="link-to-resort-show" onclick='window.location = "/states/${state_name}/resorts/${resort_href}"'>
                    Full Page
                  </div>
                </div>
                <div class="col">
                </div>
              </div>
              <div class="row justify-content-center" id="resort-snow-stake-picture-row">
                <div class="col">
                  <div class="resort-snow-stake-picture-header">
                    Webcam
                  </div>
                  <div class="resort-snow-stake-picture-container">
                    <img id="event-cover-image" src="${resort.snowstake_url}?${Math.floor((Math.random() * 1000) + 1).toString()}" class="img-thumbnail" style="width:90vw;">
                  </div>
                </div>
              </div>
              <div class="row justify-content-center">
                <div class = "col>
                  <div id="current-conditions-table-container">
                    <div class="current-conditions-table-name">
                    Current Conditions
                    </div>
                    <table id="current-conditions-table" >
                      <thead>
                        <tr id="current-conditions-table-header">
                          <th> Temp</th>
                          <th> Wind Speed</th>
                          <th> Wind Direction</th>
                        </tr>
                      </thead>
                      <tbody id=current-conditions-table-body>
                        <tr>
                          <td>${resort.current_temp}°f</td>
                          <td>${resort.current_wind_speed}</td>
                          <td>${resort.current_wind_dir}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div class="row justify-content-center" id="resort-forecast-row">
                <div class="col">
                  <div id="resort-forecast-whole-table-container">
                    <div class="resort-forecast-table-name">
                      Forecast
                    </div>
                    <div class="resort-forecast-only-table-container">
                      <table id="resort-forecast-table >
                        <thead>
                          <tr id="resort-forecast-table-header">
                            <th></th>
                            <th> ${resort.period_one_dow} </th>
                            <th> ${resort.period_one_dow} Night</th>
                            <th> ${resort.period_two_dow} </th>
                            <th> ${resort.period_two_dow} Night</th>
                            <th> ${resort.period_three_dow} </th>
                            <th> ${resort.period_three_dow} Night</th>
                            <th> ${resort.period_four_dow} </th>
                            <th> ${resort.period_four_dow} Night</th>
                            <th> ${resort.period_five_dow} </th>
                            <th> ${resort.period_five_dow} Night</th>
                          </tr>
                        </thead>
                        <tbody id=resort-forecast-table-body>
                          <tr>
                            <th>Snow</th>
                            <td>${resort.period_one_day_snow}"</td>
                            <td>${resort.period_one_night_snow}"</td>
                            <td>${resort.period_two_day_snow}"</td>
                            <td>${resort.period_two_night_snow}"</td>
                            <td>${resort.period_three_day_snow}"</td>
                            <td>${resort.period_three_night_snow}"</td>
                            <td>${resort.period_four_day_snow}"</td>
                            <td>${resort.period_four_night_snow}"</td>
                            <td>${resort.period_five_day_snow}"</td>
                            <td>${resort.period_five_night_snow}"</td>
                          </tr>
                          <tr>
                            <th>Temp</th>
                            <td>${resort.period_one_day_temp}°f</td>
                            <td>${resort.period_one_night_temp}°f</td>
                            <td>${resort.period_two_day_temp}°f</td>
                            <td>${resort.period_two_night_temp}°f</td>
                            <td>${resort.period_three_day_temp}°f</td>
                            <td>${resort.period_three_night_temp}°f</td>
                            <td>${resort.period_four_day_temp}°f</td>
                            <td>${resort.period_four_night_temp}°f</td>
                            <td>${resort.period_five_day_temp}°f</td>
                            <td>${resort.period_five_night_temp}°f</td>
                          </tr>
                          <tr>
                            <th>Weather</th>
                            <td>${resort.period_one_day_weather}</td>
                            <td>${resort.period_one_night_weather}</td>
                            <td>${resort.period_two_day_weather}</td>
                            <td>${resort.period_two_night_weather}</td>
                            <td>${resort.period_three_day_weather}</td>
                            <td>${resort.period_three_night_weather}</td>
                            <td>${resort.period_four_day_weather}</td>
                            <td>${resort.period_four_night_weather}</td>
                            <td>${resort.period_five_day_weather}</td>
                            <td>${resort.period_five_night_weather}</td>
                          </tr>
                          <tr>
                            <th>Wind</th>
                            <td>${resort.period_one_day_wind_speed}</td>
                            <td>${resort.period_one_night_wind_speed}</td>
                            <td>${resort.period_two_day_wind_speed}</td>
                            <td>${resort.period_two_night_wind_speed}</td>
                            <td>${resort.period_three_day_wind_speed}</td>
                            <td>${resort.period_three_night_wind_speed}</td>
                            <td>${resort.period_four_day_wind_speed}</td>
                            <td>${resort.period_four_night_wind_speed}</td>
                            <td>${resort.period_five_day_wind_speed}</td>
                            <td>${resort.period_five_night_wind_speed}</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  <div>
                <div>
              </div>

            </div>
          </div>
        </div>
      </div>

      <script>
      $("p.trigger-${index}").click(function(){
          $(this).toggleClass("active")
          $('.toggle_container.${index}').slideToggle("normal");
      });
      </script>
      `
    )
  })
  $('#resorts-modal-body').append(
    `
    <script>
    $(".toggle_container").hide();
    </script>
    `
  )
}
