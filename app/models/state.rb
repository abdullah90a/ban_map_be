# frozen_string_literal: true

class State < ApplicationRecord
  has_many :cities
  attribute :name, String
  attribute :code, String
end
