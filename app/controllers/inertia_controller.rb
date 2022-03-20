class InertiaController < ApplicationController
  # include FormOptions
  # before_action :authenticate_user!

  inertia_share do
    ret = {}
    if flash[:errors]
      ret['errors'] = flash[:errors]
    end
    if flash[:message]
      ret['message'] = flash[:message]
    end
    # if user_signed_in?
    #   ret['user'] = {id: current_user.id, email: current_user.email}
    # end

    # ret['form_options'] = form_options

    ret
  end

  def inertia(page, props, url = nil)
    # I18n.enforce_available_locales!(:de)
    # @i18n = I18n.config.backend.translations[:de]
    render inertia: page,
           url: url,
           props: props
  end

  def set_errors(key, errors)
    flash[:errors] ||= {}
    flash[:errors][key] = errors.as_json
  end
end
