# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  post 'city/find'
  post 'city/update'

  post 'lobster/find'
  post 'ban/find'

  resources :state, :city, :ban, :lobster, :composter, :customer, :facility

  root "welcome#index"
end
