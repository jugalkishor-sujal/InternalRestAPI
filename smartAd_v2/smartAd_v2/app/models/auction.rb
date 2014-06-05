class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :product
  has_many :ad_images
end
