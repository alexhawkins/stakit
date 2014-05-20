class AddInfoToStacks < ActiveRecord::Migration
  def change
    add_column :stacks, :description, :string
    add_column :stacks, :links, :string
  end
end