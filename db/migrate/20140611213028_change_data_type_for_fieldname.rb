class ChangeDataTypeForFieldname < ActiveRecord::Migration
   def self.up
    change_table :answers do |t|
      t.change :body, :text
    end
  end
  def self.down
    change_table :answers do |t|
      t.change :body, :string
    end
  end
end