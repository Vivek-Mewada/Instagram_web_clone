class User < ApplicationRecord
  attr_writer :login

  has_many :posts , dependent: :destroy
  has_one :profile
  has_one_attached :image

#------------------------------------FOLLOW SECTION--------------------------------#
  # ----this access the relationaship object.
  has_many :followed_users, 
            foreign_key: :follower_id,
            class_name: 'Follow', 
            dependent: :destroy

  #----this access the user through the follow object
  has_many :followees, through: :followed_users, dependent: :destroy

#------------peopel following us

  has_many :following_users, 
            foreign_key: :followee_id,
            class_name: 'Follow', 
            dependent: :destroy

  has_many :followers, through: :following_users, dependent: :destroy



  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:trackable, authentication_keys: [:login]
  
  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
