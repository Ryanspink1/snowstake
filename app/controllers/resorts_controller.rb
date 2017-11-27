class ResortsController < ApplicationController

  def show
    if Resort.find_by_name(params[:name])
    else
      redirect_to '/'
    end
  end
end
