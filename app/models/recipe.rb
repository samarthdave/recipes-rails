class Recipe < ActiveRecord::Base
	
	belongs_to :user
	
	validates_associated :user
	
	validates :name, presence: true, length: { minimum: 3, maximum: 100 }
	
	validates :summary, presence: true, length: { minimum: 10, maximum: 200 }
	
	validates :description, presence: true, length: { minimum: 3, maximum: 200 }
	
	mount_uploader :picture, PictureUploader
	
	validate :picture_size
	
	private
	
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, " should be less than 5MB.")
			end
		end
	
end