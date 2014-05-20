class AddPositionToStackSupplements < ActiveRecord::Migration
  def change
    add_column :stack_supplements, :position, :integer
  end
end
