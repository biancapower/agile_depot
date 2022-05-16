class Product < ApplicationRecord
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01, message: 'can\'t be %{value}' }
	validates :title, uniqueness: true,
										length: { minimum: 10,
															message: '"%{value}" is too short, please use at least 10 characters' }
	validates :image_url, allow_blank: true, format: { 
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	def next
    Product.where("id > :id", id: id).first
	end

	def prev
		Product.where("id < :id", id: id).last
	end
end
