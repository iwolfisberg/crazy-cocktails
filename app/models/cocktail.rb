class Cocktail < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
