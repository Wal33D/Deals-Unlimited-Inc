class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :employee_name
      t.string :headshot
      t.integer :duration
      t.text :about

      t.timestamps null: false
    end
  end
end
