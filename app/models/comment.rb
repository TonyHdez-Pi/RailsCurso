class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :content

  belongs_to :user, optional: true
  
  has_many :likes, as: likable
end
