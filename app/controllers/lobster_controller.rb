# frozen_string_literal: true

class LobsterController < ApplicationController
  def all
    render json: Ban.all
  end

  def show
    lobster = Lobster.find(params[:id])
    render json: lobster
  end

  def update
    allowed_params = params.permit(:zip, :address, :phone)
    Lobster.update(params[:id], allowed_params)
  end
end
