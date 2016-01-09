class Favorite < ActiveRecord::Base
  belongs_to :post
  belongs_to :response

  validates :post_id, uniqueness: { scope: :response_id }
end
