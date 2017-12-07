class Article < ApplicationRecord
  validates :body, :title, presence: {message: "el campo no puede quedar vacío"}
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :comments
  
  scope :published, ->{where("articles.published_at IS NOT NULL")}
  scope :draft, ->{where("articles.published_at IS NULL")}
  scope :recent, ->{published.where("articles.published_at > ?", 2.years.ago).limit(1)}
  
  scope :con_titulo, ->(term=''){ where("articles.title like ?","%#{term}%")}
  
  
end
