# frozen_string_literal: true

class Facility < ApplicationRecord
  belongs_to :city
  attribute :city_id, Integer
  attribute :name, String
  attribute :address, String
  attribute :postal_code, String
  attribute :capability, String
end