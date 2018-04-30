# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      provider_callback("GitHub")
    end

    def twitter
      provider_callback("Twitter")
    end

    private

    def provider_callback(provider)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: provider)
      else
        if is_navigational_format?
          set_flash_message(:alert,
                            :failure,
                            kind: provider,
                            reason: "Probably, we didn't receive your email from #{provider}")
        end
        redirect_to new_user_registration_url
      end
    end
  end
end
