class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :doses, dependent: :destroy
  accepts_nested_attributes_for :doses
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  # validates :description, presence: true
end
