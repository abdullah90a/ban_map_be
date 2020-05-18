# frozen_string_literal: true

class ComposterController < ApplicationController
  def update
    allowed_params = params.permit(:name, :url, :email, :phone, :active)
    Composter.update(params[:id], allowed_params)
  end
end
