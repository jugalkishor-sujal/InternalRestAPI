class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile, :string
    add_column :users, :tel, :string
    add_column :users, :address, :text
    add_column :users, :description, :text
    add_column :users, :website, :string
  end
end
