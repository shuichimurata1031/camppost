class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :campposts
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  #フォローの関係を表すModel
  
  #フォローの関係を手軽に作成したり外したりするためのメソッド
  def follow(other_user)
    unless self == other_user #フォローが自分自身でないか selfにはuser が代入
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user) #既にフォローしているかどうかも分かるようにするメソッド
    self.followings.include?(other_user)
  end
  
  def feed_campposts #timeline
    Camppost.where(user_id: self.following_ids + [self.id])
  end
  
end
