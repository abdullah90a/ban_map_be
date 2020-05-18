# frozen_string_literal: true

class BanController < ApplicationController
  def all
    render json: Ban.all
  end

  def show
    ban = Ban.find(params[:id])
    render json: ban
  end

  def update
    allowed_params = params.permit(:ban_type, :ban_stage, :enacted, :proposed)
    Ban.update(params[:id], allowed_params)
  end
end
