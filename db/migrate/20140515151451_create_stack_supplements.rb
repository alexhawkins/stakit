class CreateStackSupplements < ActiveRecord::Migration
  def change
    create_table :stack_supplements do |t|
      t.references :stack, index: true
      t.references :supplement, index: true
      t.references :frequency, index: true
      t.string :dose

      t.timestamps
    end
  end
end
