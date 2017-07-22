# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :meals
  validates :email, length: { maximum: 50 }, presence: true
end
