class CreateFrenquencies < ActiveRecord::Migration
  def change
    create_table :frenquencies do |t|
      t.string :value

      t.timestamps
    end
  end
end
