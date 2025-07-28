class Tag < ApplicationRecord
  has_many :saved_article_tags, dependent: :destroy
  has_many :saved_articles, through: :saved_article_tags
  validates :name, presence: true, uniqueness: true
end
