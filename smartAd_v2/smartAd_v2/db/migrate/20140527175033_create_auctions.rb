class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.date :start_at
      t.date :end_at
      t.float :start_price
      t.float :min_step_price
      t.float :current_price
      t.integer :winner
      t.integer :product_id
      t.integer :status

      t.timestamps
    end
  end
end
