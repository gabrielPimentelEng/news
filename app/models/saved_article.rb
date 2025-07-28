class SavedArticle < ApplicationRecord
  belongs_to :user
  has_many :saved_article_tags, dependent: :destroy
  has_many :tags, through: :saved_article_tags
end
