class AddPositionToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :position, :integer, :default => 99
  end
end
