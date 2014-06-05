class AddCoverToUser < ActiveRecord::Migration
  def change
    add_column :users, :cover_file_name, :string
    add_column :users, :cover_file_size, :integer
    add_column :users, :cover_content_type, :string
  end
end
