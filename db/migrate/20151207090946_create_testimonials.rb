class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.integer :stars
      t.text :testimonial
      t.string :date

      t.timestamps null: false
    end
  end
end
