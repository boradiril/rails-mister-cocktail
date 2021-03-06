class Dose < ApplicationRecord
  belongs_to :cocktail, required: true
  belongs_to :ingredient, required: true

  validates_uniqueness_of :cocktail_id, scope: [:ingredient_id]
  validates :description, presence: true

end
