class AddEmailPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_stack_favorites, :boolean, default: false
  end
end
