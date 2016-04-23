# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#
class User < ActiveRecord::Base
  DEFAULT_USER_EMAIL = "default.user@montrealrb.com".freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_one :member

  def self.from_omniauth(auth)
    find_by(provider: auth.provider, uid: auth.uid) ||
    find_or_create_by(email: auth.info.email) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] &&
                session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.create_default_user!
    User.create! email: User::DEFAULT_USER_EMAIL, password: "12345678"
  end

  def self.default_user
    User.find_by(email: DEFAULT_USER_EMAIL)
  end

  # make it impossible for the default user to authenticate
  def active_for_authentication?
    super && email != DEFAULT_USER_EMAIL
  end
end
