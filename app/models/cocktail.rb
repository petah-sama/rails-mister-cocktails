class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
