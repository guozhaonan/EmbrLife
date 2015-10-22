class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #creates relationship between ideas and users
  has_many :ideas
  #Creates Relationships for subscriptions to ideas
  has_many :subscriptions


  #creates self referential relationships
  has_many :friendships

  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  #Creates Messaging Functionality
  has_many :conversations, :foreign_key => :sender_id
  after_create :create_default_conversation

  # OTM relationship with comments
  has_many :comments

  #Notification Relationship
  has_many :notifications

  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end

end
