class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :title, presence: true
    belongs_to :user
    has_many_attached :images
end
