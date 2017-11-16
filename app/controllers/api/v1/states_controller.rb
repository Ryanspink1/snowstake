class Api::V1::StatesController < ApplicationController

  def index
    render json: State.all_states
  end
end
