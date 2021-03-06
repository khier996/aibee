class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  has_attachment :photo
  validates :photo, presence: true

  has_many :host_events, through: :hobbies, source: :events
  has_many :requests, through: :host_events, source: :bookings
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :hobbies
  has_many :bookings
  has_many :events, through: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :wechat]


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

def self.find_for_wechat_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    # user_params.merge! auth.info.slice(:first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.headimgurl
    user_params[:first_name]=auth.info.nickname
    user_params[:last_name]='微信用户'

    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    # user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.email = Devise.friendly_token[0,10] + '@aibee.com' #fake email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end







end
