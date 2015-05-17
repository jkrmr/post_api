class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :post, index: true, foreign_key: true, dependent: :delete
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
