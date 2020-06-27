class Event < ApplicationRecord
    has_many :user_events
    has_many :users, through: :user_events
    belongs_to :charity
end
