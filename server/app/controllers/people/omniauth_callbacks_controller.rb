require 'uri'
class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ldap
    @person = Person.all.find_all { |p| p.employee.login == auth_login }.first
    if @person#.persisted?
      #sign_in_and_redirect @person, :event => :authentication
      apiKey = ApiKey.create person: @person
      sign_in @person
      redirect_to  add_param(params[:redirect_uri], 'access_token', apiKey.access_token)
      set_flash_message(:notice, :success, :kind => "LDAP") if is_navigational_format?
    else
      session["devise.ldap_data"] = auth_login
      redirect_to '/'
    end
  end

  def failure
  end
    
  protected
  def add_param(url, param_name, param_value)
    uri = URI(url)
    params = URI.decode_www_form(uri.query || []) << [param_name, param_value]
    uri.query = URI.encode_www_form(params)
    uri.to_s
  end

  def auth_hash
    request.env['omniauth.auth']
  end
  def auth_login
    auth_hash['extra']['raw_info']['samaccountname'].first.to_s
  end
end
