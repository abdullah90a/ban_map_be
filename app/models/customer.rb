# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :city
  attribute :city_id, Integer
  attribute :zip, String
end
