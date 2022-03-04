class BodyMake < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :weight, presence: true
end