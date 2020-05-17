# frozen_string_literal: true

class Composter < ApplicationRecord
  belongs_to :city
  attribute :city_id, Integer
  attribute :name, String
  attribute :url, String
  attribute :email, String
  attribute :phone, String
  attribute :active, Boolean
end