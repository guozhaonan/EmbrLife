class Activity < ActiveRecord::Base
  belongs_to :user
  has_one :notification
end
