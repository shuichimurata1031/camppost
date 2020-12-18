class Camppost < ApplicationRecord
  belongs_to :user
  #belongs_to :user の関連付けによって、ユーザの紐付け無しには Micropost を保存できません。
  validates :address, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  mount_uploader :image, ImageUploader
end
