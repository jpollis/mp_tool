class HomeController < ApplicationController
  def index
    @company = params[:website]
  end
end
