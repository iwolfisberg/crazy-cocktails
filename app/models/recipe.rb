class Recipe < ApplicationRecord
  belongs_to :cocktail

  validates :description, presence: true
end
