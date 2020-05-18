# frozen_string_literal: true

class CustomerController < ApplicationController
  def update
    allowed_params = params.permit(:zip)
    Customer.update(params[:id], allowed_params)
  end
end
