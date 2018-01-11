class Event < ApplicationRecord
  belongs_to      :organizer,   class_name: 'User', foreign_key: 'user_id'

  validates       :title,       presence: true,     length: { minimum: 5 }
  validates       :description, presence: true
  validates_date  :start_date,  :on_or_after =>     :today, on: :create
  validates_date  :end_date,    :on_or_after =>     :today, on: :create
  validates       :venue,       presence: true
  validates       :location,    presence: true

  mount_uploader :image, ImageUploader
end
