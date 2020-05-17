# frozen_string_literal: true

class City < ApplicationRecord
  # belongs_to :state
  has_one :ban, dependent: :destroy
  has_many :lobsters
  # has_many :customers
  # has_many :composters
  # has_many :facilities
end
