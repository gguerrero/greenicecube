class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
   
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end
   
  # Get locale from top-level domain or return nil if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.org
  #   127.0.0.1 es.application.org
  #   127.0.0.1 de.application.org
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.domain.split('.').first
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
  end
  
  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  # def set_locale
  #   logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
  #   I18n.locale = extract_locale_from_accept_language_header
  #   logger.debug "* Locale set to '#{I18n.locale}'"
  # end

  # private
  # def extract_locale_from_accept_language_header
  #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  # end  
end
