# frozen_string_literal: true

Rails.application.routes.draw do
  post 'city/find'
  post 'lobster/find'
  post 'ban/find'

  resources :state, :city, :ban, :lobster, :composter, :customer, :facility
end
