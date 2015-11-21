require 'carrierwave/orm/activerecord'

class Vehicle < ActiveRecord::Base
	  mount_uploaders :vehicle_images, VehicleImagesUploader
end
