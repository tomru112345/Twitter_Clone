class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :follows, foreign_key: :follower_id
  has_many :inverse_followers, through: :follows
  has_many :inverse_follows, foreign_key: :inverse_follower_id, class_name: 'Follow'
  has_many :followers, through: :inverse_follows
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :doubts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 4..24 }
  validates :screen_name, length: { maximum: 140 }
  validates :bio, length: { maximum: 200  }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password

  default_scope -> { order(score_ave: :desc) }

  def followed_by? user
    if user.instance_of?(User)
      inverse_follows.where(follower_id: user.id).exists?
    end
  end 

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
        notification = current_user.active_notifications.new(
            visited_id: id,
            action: 'follow'
        )
        notification.save if notification.valid?
    end
  end

end