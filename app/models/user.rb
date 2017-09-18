# frozen_string_literal: true

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
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#
class User < ActiveRecord::Base
  DEFAULT_USER_EMAIL = "default.user@montrealrb.com"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i(github twitter)

  has_one :member

  class << self
    def from_omniauth(auth)
      find_with_auth_provider(auth) ||
        find_existing_with_auth_email(auth) ||
        create_with_auth(auth)
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.github_data"]&.dig("extra", "raw_info")
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def create_default_user!
      User.create! email: User::DEFAULT_USER_EMAIL, password: "12345678"
    end

    def default_user
      User.find_by(email: DEFAULT_USER_EMAIL)
    end

    private

    def find_with_auth_provider(auth)
      find_by(provider: auth.provider, uid: auth.uid)
    end

    def find_existing_with_auth_email(auth)
      find_by(email: auth.info.email).tap do |user|
        user&.update_attributes(provider: auth.provider, uid: auth.uid)
      end
    end

    def create_with_auth(auth)
      create(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        provider: auth.provider,
        uid: auth.uid
      )
    end
  end # class << self

  # make it impossible for the default user to authenticate
  def active_for_authentication?
    super && email != DEFAULT_USER_EMAIL
  end
end
