class AddFeaturedAndPollToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :featured, :boolean
    add_column :ideas, :poll, :boolean
  end
end
