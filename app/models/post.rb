class Post < ActiveRecord::Base
  has_many :responses, as: :comment
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  has_one :favorite
  has_one :accepted, through: :favorite, source: :response

end
