class SavedArticleTag < ApplicationRecord
  belongs_to :saved_article
  belongs_to :tag
end
