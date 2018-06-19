class Recipe < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {maximum: 2000}
  belongs_to :chef, optional: true
  validates :chef_id, presence: true
  
  has_many :ingredients, inverse_of: :recipe
  has_many :directions, inverse_of: :recipe
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  
  mount_uploader :image, ImageUploader
 

end
