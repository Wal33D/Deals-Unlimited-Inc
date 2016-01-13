class CreateCreditAppLockers < ActiveRecord::Migration
  def change
    create_table :credit_app_lockers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
