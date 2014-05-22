class AddPrivacyToStacks < ActiveRecord::Migration
  def change
    add_column :stacks, :public, :boolean, default: true
  end
end
