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
  default_scope -> { order(updated_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  def self.search(params)
    recipes = Recipe.includes(:ingredients).where("description LIKE ? or title LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    recipes
  end

  # def self.search(params)
  #   joins(:ingredients).where("description LIKE ? or title LIKE ? or recipe.ingredients LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  #
  #     # .where("description = :params OR title = :params OR recipes.ingredient = :params", params: params)
  #   end
  end
