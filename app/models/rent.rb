class Rent < ApplicationRecord
    has_many :comments, as: :commentable
end
