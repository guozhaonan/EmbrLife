class Idea < ActiveRecord::Base

  has_many :subscriptions, :dependent => :destroy
  belongs_to :author, :class_name => "User"

  # images
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  # OTM relationship with comments
  has_many :comments
end
