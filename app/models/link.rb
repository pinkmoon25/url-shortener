class Link < ApplicationRecord
  validates :long_url, :short_url, :clicks, presence: true
  validates :long_url, url: true
  validates :short_url, uniqueness: true
  validates :long_url, length: {in: 3..300}, on: :create
  validates :short_url, length: {in: 3..50}, on: :create
  validates :alias, length: {in: 3..7}, allow_blank: true

  belongs_to :user

  def generate_mini_url
    host = "http://localhost:3000/"
    url = host + SecureRandom.uuid()[0..6]
    url
  end
  
end
