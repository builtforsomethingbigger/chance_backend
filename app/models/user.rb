class User < ApplicationRecord
    has_many :inboxes
    has_many :messages, through: :inboxes
    has_many :donations
    has_many :charities, through: :donations
    has_many :user_events
    has_many :events, through: :user_events
end
