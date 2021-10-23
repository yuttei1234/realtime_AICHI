class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :caption, presence: true
  validates :caption, length: { maximum: 200 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end