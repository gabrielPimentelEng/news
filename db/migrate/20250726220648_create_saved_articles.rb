class CreateSavedArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :saved_articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.string :source

      t.timestamps
    end
  end
end
