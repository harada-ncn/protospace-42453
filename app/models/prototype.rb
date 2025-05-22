class Prototype < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :comments

  validates :title, :catch_copy, :concept, :image, presence: true
end
