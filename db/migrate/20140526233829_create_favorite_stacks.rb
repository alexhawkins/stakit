class CreateFavoriteStacks < ActiveRecord::Migration
  def change
    create_table :favorite_stacks do |t|
      t.references :stack, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
