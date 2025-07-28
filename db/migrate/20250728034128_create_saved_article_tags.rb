class CreateSavedArticleTags < ActiveRecord::Migration[8.0]
  def change
    create_table :saved_article_tags do |t|
      t.references :saved_article, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
