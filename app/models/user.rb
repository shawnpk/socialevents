class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username

  has_many :organized_events, class_name: 'Event', dependent: :destroy
  has_many :attendances
  has_many :attended_events, through: :attendances

  validates :username, presence: true, length: { minimum: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    "#{username}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
