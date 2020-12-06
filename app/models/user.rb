class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  validates :name, presence:true,
                   length: {in: 2..20},
                   uniqueness: true
  
  validates :introduction, length: {maximum: 50}
                   
                   

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #followerの取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # followedの取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #自分がフォローしている人
  has_many :following_user, through: :follower, source: :followed
  # 自分がフォローされている人
  has_many :followed_user, through: :followed, source: :follower
  
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(follow_id: user_id).destroy
  end
  
  def following?(user)
    following_user.include?(user)
  end
  
  attachment :profile_image
end
