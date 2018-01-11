class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :events

  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
end
