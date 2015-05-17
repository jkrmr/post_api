class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.integer :posts_count, default: 0

      t.timestamps null: false
    end
  end
end
