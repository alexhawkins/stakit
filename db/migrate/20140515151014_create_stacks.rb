class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
