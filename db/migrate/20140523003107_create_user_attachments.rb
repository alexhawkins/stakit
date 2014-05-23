class CreateUserAttachments < ActiveRecord::Migration
  def change
    create_table :user_attachments do |t|
      t.references :user, index: true
      t.string :image

      t.timestamps
    end
  end
end
