require 'carrierwave/orm/activerecord'
class Meet < ActiveRecord::Base
	mount_uploaders :headshot_images, HeadshotImagesUploader
end