class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true, dependent: :delete
      t.text :content, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.string :ancestry, index: true

      t.timestamps null: false
    end
  end
end
