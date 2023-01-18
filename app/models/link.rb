class Link < ApplicationRecord
  validates :long_url, :short_url, :clicks, presence: true
  validates :short_url, uniqueness: true
  validates :long_url, length: {in: 3..300}, on: :create
  validates :short_url, length: {in: 3..300}, on: :create
  validates :alias, length: {minimum: 3}, allow_blank: true

  def generate_mini_url
    str = 'https://mini/'
    url = str + SecureRandom.uuid()[0..6]
    url
  end
  
end
