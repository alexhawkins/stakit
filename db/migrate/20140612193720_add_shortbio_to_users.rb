class AddShortbioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shortbio, :string
  end
end
