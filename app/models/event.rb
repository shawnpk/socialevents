class Event < ApplicationRecord
  validates       :title,       presence: true, length: { minimum: 5 }
  validates       :description, presence: true
  validates_date  :start_date,  :on_or_after => :today
  validates_date  :end_date,    :on_or_after => :today
  validates       :venue,       presence: true
  validates       :location,    presence: true
end
