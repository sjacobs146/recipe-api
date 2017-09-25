# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true
end
