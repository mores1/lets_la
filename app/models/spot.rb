class Spot < ApplicationRecord
  
  belongs_to :user
  has_many :spot_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_one_attached :image_id
  
  def get_image_id
    (image_id.attached?) ? image_id : 'no_image.jpg'
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
end
