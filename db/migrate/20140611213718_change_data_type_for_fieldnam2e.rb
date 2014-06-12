class ChangeDataTypeForFieldnam2e < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.change :name, :text
      t.change :description, :text
    end
  end
  def self.down
    change_table :questions do |t|
      t.change :name, :string
      t.change :description, :string
    end
  end
end
