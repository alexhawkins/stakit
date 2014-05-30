class AddRankToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rank, :float
  end
end
