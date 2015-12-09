class AutoMake < ActiveRecord::Base
  has_many :auto_models
  validates :title, :uniqueness => true
  
end
