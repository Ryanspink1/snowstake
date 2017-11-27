class Api::V1::ResortsController < ApplicationController

  def show
    if Resort.find_by_name(resort_name[:name])
      render json: Resort.retrieve_all_data(resort_name[:name])
    else
      render json: {status: "failure"}
    end
  end

  private

  def resort_name
    params.permit(:name)
  end

end
