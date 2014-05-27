class CreateQuestionTopics < ActiveRecord::Migration
  def change
    create_table :question_topics do |t|
      t.references :topic, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
