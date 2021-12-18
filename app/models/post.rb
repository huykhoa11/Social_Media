class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :favorites
end
