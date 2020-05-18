# frozen_string_literal: true

class CityController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @city = City.find(params[:id])
  end

  def find
    @find_result = City.where("name like '%#{params[:name]}%'").limit(10)
  end

  def update
    allowed_params = params.permit(
      :name,
      :latitude,
      :longitude,
      :population,
      :zips,
      :density,
      :county
    )
    @city = City.update(params[:id], allowed_params)
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
