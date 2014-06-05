class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :auctions, :end_at, :datetime
    change_column :auctions, :start_at, :datetime
  end
end
