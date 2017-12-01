class Article < ApplicationRecord
  validates :body, :title, presence: {message: "el campo no puede quedar vacío"}
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :comments
end
