require 'uri'
class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ldap
    @person = Person.where( 'employee.login' => auth_login ).first
    if @person#.persisted?
      #sign_in_and_redirect @person, :event => :authentication
      apiKey = ApiKey.create person: @person
      sign_in @person
      redirect_to  add_params(params[:redirect_uri], apiKey.access_token, @person.id), status: 303
      set_flash_message(:notice, :success, :kind => "LDAP") if is_navigational_format?
    else
      session["devise.ldap_data"] = auth_login
      redirect_to '/'
    end
  end

  def failure
    if params[:redirect_uri]
      redirect_to "#{params[:redirect_uri]}?message=Invalid%20password%20or%20username."
    end
  end
    
  protected
  def add_params(url, token, person_id)
    "#{url}?access_token=#{token}&person_id=#{person_id}"
  end

  def auth_hash
    request.env['omniauth.auth']
  end
  def auth_login
    auth_hash['extra']['raw_info']['samaccountname'].first.to_s
  end
end
