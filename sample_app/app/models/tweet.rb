class Tweet < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy 

    validates :user, presence: true
	validates :content, presence: true, length: { in: 1..140}

    def favorited_by? user
        favorites.where(user_id: user.id).exists?
    end 

    default_scope -> { order(created_at: :desc) }
end
