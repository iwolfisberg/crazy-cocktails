class Cocktail < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
