class AddUserIdToNotifications < ActiveRecord::Migration
  def change
    create_table "notifications", force: :cascade do |t|
      t.integer  "user_id"
    end
  end
end
