class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: {in: 3..25}, on: :create
  has_many :links, dependent: :destroy
end
