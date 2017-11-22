class Api::V1::StatesController < ApplicationController

  def show
    render json: State.find_resorts(state_name[:id])
  end

  def index
    render json: State.all_states
  end

  private

  def state_name
    params.permit(:id)
  end

end
