class User < ActiveRecord::Base
  after_create :build_defaults

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter, :facebook]

  has_one  :contact, as: :contactable
  has_many :jobs
  has_many :contracts, through: :jobs
  has_one  :contractor

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

private
  def build_defaults
    build_contact.save
  end
end
