class Article < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :description, :user_id

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true
end
