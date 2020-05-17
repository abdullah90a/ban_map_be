# frozen_string_literal: true

class MainController < ApplicationController
  def index
    render template: "views/main/index"
  end
end
