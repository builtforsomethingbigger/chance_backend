class Message < ApplicationRecord
    has_many :inboxes
    has_many :users, through: :inboxes
end
