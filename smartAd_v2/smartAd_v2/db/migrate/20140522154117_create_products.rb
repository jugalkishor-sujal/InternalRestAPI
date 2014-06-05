class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :user_id
      t.integer :format_id
      t.integer :form_factor_id
      t.integer :time_share_id
      t.integer :duration
      t.integer :grade_id
      t.integer :product_type_id
      t.integer :period_id
      t.date :expiry_date
      t.date :start_at
      t.integer :position_id
      t.float :price

      t.timestamps
    end
  end
end
