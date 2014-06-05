class AddIsUploadToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :is_uploaded, :boolean
  end
end
