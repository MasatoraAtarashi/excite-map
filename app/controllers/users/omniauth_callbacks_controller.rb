# frozen_string_literal: true

class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  include DeviseTokenAuth::Concerns::SetUserByToken

  def redirect_callbacks
    super
  end

  def omniauth_success
    super
    update_auth_header
  end

  def omniauth_failure
    super
  end

  def get_resource_from_auth_hash
    super
    set_email
  end

  def render_data_or_redirect(message, data, user_data = {})
    if Rails.env.production?
      if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
        render_data(message, user_data.merge(data))
      elsif auth_origin_url
        redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
      else
        fallback_render data[:error] || 'An error occurred'
      end
    else
      render json: @resource, status: :ok
    end
  end

  def set_email
    @resource.email = "#{@resource.uid}-#{@resource.provider}@example.com"
  end

end
