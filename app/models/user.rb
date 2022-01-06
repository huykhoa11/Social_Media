class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

	has_many :posts
	has_one_attached :avatar
	after_commit :add_default_avatar, on: %i[create update]

	def avatar_thumbnail
		if avatar.attached?
			#avatar.variant(resize: '50x50!').processed
		else
			"/default_profile.png"
		end
	end


	private
	def add_default_avatar
		unless avatar.attached?
			avatar.attach(
				io: File.open(
					Rails.root.join(
						'app', 'assets', 'images', 'default_profile.png'
					)
				),
				filename: "default_profile.png",
				content_type: 'image/jpg'
			)
		end
	end


end
