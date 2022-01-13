class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :title, presence: true
    belongs_to :user
    has_many_attached :images
    validate :image_type

    private
    def image_type
    	if images.attached? == false
    		errors.add(:images, "are missings")
    	end
    end

end
