class User < ApplicationRecord
    has_many :inboxes
    has_many :messages, through: :inboxes
    has_many :donations
    has_many :charities, through: :donations
    has_many :events
end
