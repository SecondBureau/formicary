class AddToUrlToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :to_url, :string
  end
end
