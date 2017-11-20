
function getStateData(){
  $.ajax({
    url: `/api/v1/states`,
    method: 'GET'
  }).then(function(data){
    appendStates(data)
  })
  .catch(function(error){
    console.error(error)
  })
}

function appendStates(states){
  states.forEach(function(state){
    $('#states-index-container').append(
      `
      <div class="state-index-item" onclick="window.location='/states/${state.name}'">
        <div class="state-index-item-header">
          <span class="image-text">
            ${state.name}
          </span>
        </div>
        <div class="state-index-item-picture">
          <img id="state-index-item-image" src=${state.picture_url} class="img-thumbnail">
        </div>
      </div>
      `
    )
  })
}
