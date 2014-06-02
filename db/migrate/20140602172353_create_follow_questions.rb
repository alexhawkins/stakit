class CreateFollowQuestions < ActiveRecord::Migration
  def change
    create_table :follow_questions do |t|
      t.references :question, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
