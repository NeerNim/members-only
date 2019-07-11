class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
  validates_length_of :title, minimum: 10, message: 'Title must be atleast 10 characters long'
end
