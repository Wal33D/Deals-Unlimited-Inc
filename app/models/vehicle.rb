require 'carrierwave/orm/activerecord'

class Vehicle < ActiveRecord::Base
	  paginates_per 25
	  mount_uploaders :vehicle_images, VehicleImagesUploader
end
