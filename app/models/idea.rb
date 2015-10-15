class Idea < ActiveRecord::Base
  # MTM relationship with users
  has_and_belongs_to_many :users, :dependent => :destroy

  # images
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  # OTM relationship with comments
  has_many :comments
end
