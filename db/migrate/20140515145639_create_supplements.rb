class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string :name
      t.string :default_dose
      t.string :default_frequency

      t.timestamps
    end
  end
end
