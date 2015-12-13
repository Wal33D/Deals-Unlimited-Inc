class Testimonial < ActiveRecord::Base
validates :name, :uniqueness => true
end