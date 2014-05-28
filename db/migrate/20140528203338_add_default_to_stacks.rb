class AddDefaultToStacks < ActiveRecord::Migration
  def change
    add_column :stacks, :default, :boolean, default: false
  end
end
