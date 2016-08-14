class Recipe < ActiveRecord::Base
	
	belongs_to :user
	
	validates_associated :user
	
	validates :name, presence: true, length: { minimum: 3, maximum: 100 }
	
	validates :summary, presence: true, length: { minimum: 10, maximum: 200 }
	
	validates :description, presence: true, length: { minimum: 3, maximum: 200 }
	
end