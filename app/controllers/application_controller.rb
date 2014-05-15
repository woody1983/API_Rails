class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  protected
    def set_locale
      #I18n.locale = request.headers['Accept-Language']
      locales = I18n.available_locales
      I18n.locale = http_accept_language.compatible_language_from(locales)
    end
end
