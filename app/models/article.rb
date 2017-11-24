class Article < ApplicationRecord
  validates :body, :title, presence: {message: "el campo no puede quedar vacío"}
end
