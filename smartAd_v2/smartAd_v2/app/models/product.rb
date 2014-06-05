class Product < ActiveRecord::Base
  has_many :auctions
  acts_as_taggable_on :tags
  acts_as_taggable_on :product_options, :form_factors, :formats, :grades, :periods, :product_types, :time_shares

  validates :name, presence: true
  validates :expiry_date, presence: true
  validates :start_at, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  
  has_attached_file :cover,:whiny => false, :styles => { 
      :medium => "360x148#",
      :thumb => "180x74#"
    },
  :url  => "/images/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/images/products/:id/:style/:basename.:extension",
  :default_url => '/images/frontend/default-banner.png',
  :default_style => :thumb
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
