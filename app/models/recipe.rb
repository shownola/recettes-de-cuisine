class Recipe < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {maximum: 2000}
  
  belongs_to :chef, optional: true
  validates :chef_id, presence: true
  
  mount_uploader :image, ImageUploader
end
