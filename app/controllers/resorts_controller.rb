class ResortsController < ApplicationController

  def show
    if Resort.find_by_name(resort_params[:name])
    else
      redirect_to '/'
    end
  end

  private

  def resort_params
    params.permit(:name)
  end


end
