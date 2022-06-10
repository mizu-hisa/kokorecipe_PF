class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.integer :user_id
      t.string :title
      t.text :detail
      t.string :image_id
      t.integer :likes_count

      t.timestamps
    end
  end
end
