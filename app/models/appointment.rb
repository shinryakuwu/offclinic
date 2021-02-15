class Appointment < ApplicationRecord
	belongs_to :doctor
	belongs_to :patient
	delegate :name, to: :doctor, prefix: true
	delegate :name, to: :patient, prefix: true
	validates :comment, length: { maximum: 800 }
end
