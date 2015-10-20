class EditYearInUser < ActiveRecord::Migration
  def change
     change_table :users do |t|
       t.change :year, :integer
     end
  end
end
