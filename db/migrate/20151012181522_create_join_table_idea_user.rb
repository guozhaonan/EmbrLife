class CreateJoinTableIdeaUser < ActiveRecord::Migration
  def change
    create_join_table :ideas, :users do |t|
      t.belongs_to :idea, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
