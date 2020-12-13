class Camppost < ApplicationRecord
  belongs_to :user
  #belongs_to :user の関連付けによって、ユーザの紐付け無しには Micropost を保存できません。
  validates :content, presence: true, length: { maximum: 255 }
end
