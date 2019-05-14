class Recipe < ApplicationRecord
  belongs_to :category
  has_one_attached :photo

  validates :title, presence: true
  validates :photo, presence: true
  validates :ingredient, presence: true
  validates :body,presence: true
end
