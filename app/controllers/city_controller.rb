# frozen_string_literal: true

class CityController < ApplicationController
  def show
    city = City.find(params[:id])
    render json: city
  end

  def find
    cities = City.where("name like '%#{params[:name]}%'").limit(10)
    response = cities.map do |city|
      {
        city: city,
        ban: city.ban,
        lobsters: city.lobsters
      }
    end
    render json: response
  end
end
