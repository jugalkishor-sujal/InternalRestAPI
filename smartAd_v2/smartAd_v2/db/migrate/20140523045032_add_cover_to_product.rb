class AddCoverToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cover_file_name, :string
    add_column :products, :cover_content_type, :string
    add_column :products, :cover_file_size, :integer
  end
end
