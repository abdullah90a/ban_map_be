# frozen_string_literal: true

class FacilityController < ApplicationController
  def update
    allowed_params = params.permit(:name, :address, :postal_code, :capability)
    Lobster.update(params[:id], allowed_params)
  end
end
