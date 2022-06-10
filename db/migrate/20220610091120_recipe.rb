class Recipe < ActiveRecord::Migration[6.1]
  def change
    drop_table :recipe # ここを追加
  end
end
