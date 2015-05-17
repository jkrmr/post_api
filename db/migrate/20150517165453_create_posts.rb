class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true, dependent: :delete
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :archived, default: false

      t.integer :comments_count, default: 0
      t.integer :images_count, default: 0

      t.timestamps null: false
    end
  end
end
