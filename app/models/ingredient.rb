class Ingredient < ApplicationRecord
  belongs_to :recipe
  
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  
end
