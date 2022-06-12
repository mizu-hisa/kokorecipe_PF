class Recipe < ApplicationRecord

  belongs_to :customer
  has_one_attached :image
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
