class CreateContactStores < ActiveRecord::Migration
  def change
    create_table :contact_stores do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :message
      t.string :nickname

      t.timestamps null: false
    end
  end
end
