class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.references :customer
      t.string :title
      t.text :detail
      t.integer :likes_count


      t.timestamps
    end
  end
end
