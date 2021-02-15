class Category < ApplicationRecord
	has_many :doctors
	validates :name, presence: true, length: { maximum: 100 }
end
