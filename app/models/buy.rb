class Buy < ApplicationRecord
    has_many :comments, as: :commentable
end
