class AdImage < ActiveRecord::Base
  belongs_to :auction
  
  do_not_validate_attachment_file_type :image
  
  has_attached_file :image, :styles => { 
    },
  :url  => "/images/ad_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/images/ad_images/:id/:style/:basename.:extension",
  :default_url => '/images/frontend/default-avatar.png'
  
end
