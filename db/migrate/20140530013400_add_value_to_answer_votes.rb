class AddValueToAnswerVotes < ActiveRecord::Migration
  def change
    add_column :answer_votes, :value, :integer
  end
end
