require 'carrierwave/orm/activerecord'
class Vehicle < ActiveRecord::Base
paginates_per 25
mount_uploaders :vehicle_images, VehicleImagesUploader
validates :vin_num, :uniqueness => true
end