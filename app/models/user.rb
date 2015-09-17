class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ideas

  has_many :friendships

  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :conversations, :foreign_key => :sender_id
  after_create :create_default_conversation

  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
  
end
