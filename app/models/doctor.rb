class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :category
  delegate :name, to: :category, prefix: true
  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 150 }
  validates :description, length: { maximum: 1500 }
  mount_uploader :avatar, AvatarUploader
end
