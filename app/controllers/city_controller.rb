# frozen_string_literal: true

class CityController < ApplicationController
  def show
    city = City.find(params[:id])
    render json: create_response_hash(city)
  end

  def find
    cities = City.where("name like '%#{params[:name]}%'").limit(10)
    response = cities.map { |city| create_response_hash(city) }
    render json: response
  end

  private

  def create_response_hash(city)
    {
      city: city,
      ban: city.ban,
      lobsters: city.lobsters,
      facility: city.facility,
      customers: city.customers,
      composters: city.composters
    }
  end
end
