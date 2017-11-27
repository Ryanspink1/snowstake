var resort_name = window.location.href.substr(this.location.href.lastIndexOf('/') + 1)


function loadResortShow(){
  getPageData()
}

function getPageData(){
  $.ajax({
    url: `/api/v1/resorts/${resort_name}`,
    method: "get"
  }).then(
    function(data){
      populateResortShow(data);
    }
  )
}

function populateResortShow(response){
  populateResortHeader(response.name);
  populateResortPicture(response.snowstake_url);
  populateResortCurrentConditions(response);
  populateResortForecast(response);
}

function populateResortHeader(name){
  $('#resort-show-message').append(
    `
    ${name}
    `)
}

function populateResortPicture(snowstake_url){
  $('#resort-show-picture-body').append(
    `
      <img id="resort-stake-image" src="${snowstake_url}?${Math.floor((Math.random() * 1000) + 1).toString()}" class="img-thumbnail" style="width:60vw;">
    `
  )
}

function populateResortCurrentConditions(forecast){
  $('#resort-current-conditions-body').append(
    `
    <table id="resort-current-conditions-table" >
      <thead>
        <tr id="resort-current-conditions-table-header">
          <th> Temp</th>
          <th> Wind Speed</th>
          <th> Wind Direction</th>
        </tr>
      </thead>
      <tbody id=resort-current-conditions-table-body>
        <tr>
          <td>${forecast.current_temp}°f</td>
          <td>${forecast.current_wind_speed}</td>
          <td>${forecast.current_wind_dir}</td>
        </tr>
      </tbody>
    </table>
    `
  )
}

function populateResortForecast(forecast){
  $('#resort-show-forecast-body').append(
    `
    <table id="resort-show-forecast-table >
      <thead>
        <tr id="resort-forecast-table-header">
          <th></th>
          <th> ${forecast.period_one_dow} </th>
          <th> ${forecast.period_one_dow} Night</th>
          <th> ${forecast.period_two_dow} </th>
          <th> ${forecast.period_two_dow} Night</th>
          <th> ${forecast.period_three_dow} </th>
          <th> ${forecast.period_three_dow} Night</th>
          <th> ${forecast.period_four_dow} </th>
          <th> ${forecast.period_four_dow} Night</th>
          <th> ${forecast.period_five_dow} </th>
          <th> ${forecast.period_five_dow} Night</th>
        </tr>
      </thead>
      <tbody id=forecast-forecast-table-body>
        <tr>
          <th>Snow</th>
          <td>${forecast.period_one_day_snow}"</td>
          <td>${forecast.period_one_night_snow}"</td>
          <td>${forecast.period_two_day_snow}"</td>
          <td>${forecast.period_two_night_snow}"</td>
          <td>${forecast.period_three_day_snow}"</td>
          <td>${forecast.period_three_night_snow}"</td>
          <td>${forecast.period_four_day_snow}"</td>
          <td>${forecast.period_four_night_snow}"</td>
          <td>${forecast.period_five_day_snow}"</td>
          <td>${forecast.period_five_night_snow}"</td>
        </tr>
        <tr>
          <th>Temp</th>
          <td>${forecast.period_one_day_temp}°f</td>
          <td>${forecast.period_one_night_temp}°f</td>
          <td>${forecast.period_two_day_temp}°f</td>
          <td>${forecast.period_two_night_temp}°f</td>
          <td>${forecast.period_three_day_temp}°f</td>
          <td>${forecast.period_three_night_temp}°f</td>
          <td>${forecast.period_four_day_temp}°f</td>
          <td>${forecast.period_four_night_temp}°f</td>
          <td>${forecast.period_five_day_temp}°f</td>
          <td>${forecast.period_five_night_temp}°f</td>
        </tr>
        <tr>
          <th>Weather</th>
          <td>${forecast.period_one_day_weather}</td>
          <td>${forecast.period_one_night_weather}</td>
          <td>${forecast.period_two_day_weather}</td>
          <td>${forecast.period_two_night_weather}</td>
          <td>${forecast.period_three_day_weather}</td>
          <td>${forecast.period_three_night_weather}</td>
          <td>${forecast.period_four_day_weather}</td>
          <td>${forecast.period_four_night_weather}</td>
          <td>${forecast.period_five_day_weather}</td>
          <td>${forecast.period_five_night_weather}</td>
        </tr>
        <tr>
          <th>Wind</th>
          <td>${forecast.period_one_day_wind_speed}</td>
          <td>${forecast.period_one_night_wind_speed}</td>
          <td>${forecast.period_two_day_wind_speed}</td>
          <td>${forecast.period_two_night_wind_speed}</td>
          <td>${forecast.period_three_day_wind_speed}</td>
          <td>${forecast.period_three_night_wind_speed}</td>
          <td>${forecast.period_four_day_wind_speed}</td>
          <td>${forecast.period_four_night_wind_speed}</td>
          <td>${forecast.period_five_day_wind_speed}</td>
          <td>${forecast.period_five_night_wind_speed}</td>
        </tr>
      </tbody>
    </table>
    `
  )
}
