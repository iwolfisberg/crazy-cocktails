class Cocktail < ApplicationRecord
  belongs_to :user
  has_many :doses, dependent: :destroy
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  validates :description, presence: true
end
