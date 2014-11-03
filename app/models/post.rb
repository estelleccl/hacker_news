class Post < ActiveRecord::Base
  belongs_to :user
	has_many :comments
  validates :title, length: { minimum: 5 }, presence: true
  validates_uniqueness_of :title
end
