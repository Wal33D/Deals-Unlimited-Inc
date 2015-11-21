class CreateOldImages < ActiveRecord::Migration
  def change
    create_table :old_images do |t|
      t.string :title
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :image_6
      t.string :image_7
      t.string :image_8
      t.string :image_9
      t.string :image_10
      t.string :image_11
      t.string :image_12
      t.string :image_13
      t.string :image_14
      t.string :image_15
      t.string :image_16

      t.timestamps null: false
    end
  end
end
