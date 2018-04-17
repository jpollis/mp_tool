class HomeController < ApplicationController
  def index
    @company = params[:website]
    if @company.present?
      @company_url = @company.gsub("www.", "")
      @response = HTTParty.get("https://builtwith.com/#{@company_url}")
    end
    if @response.present?
      @dom = Nokogiri::HTML(@response.body)
      @tech = @dom.css('.techItem h3')[11]
      @cms = @tech.css('a')[1]
    end
  end
end
