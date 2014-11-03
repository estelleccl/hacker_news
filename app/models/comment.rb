class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
  validates :comment, length: { minimum: 5 }, presence: true
end
