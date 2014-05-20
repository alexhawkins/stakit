class AddTooltipToSupplements < ActiveRecord::Migration
  def change
    add_column :supplements, :tooltip, :string
  end
end
