class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ldap
    @person = Person.all.find_all { |p| p.employee.login == auth_login }.first
    if @person#.persisted?
      #sign_in_and_redirect @person, :event => :authentication
      sign_in @person
      redirect_to '/'
      set_flash_message(:notice, :success, :kind => "LDAP") if is_navigational_format?
    else
      session["devise.ldap_data"] = auth_login
      redirect_to '/'
    end
  end

  def failure
  end
    
  protected
  def auth_hash
    request.env['omniauth.auth']
  end
  def auth_login
    auth_hash['extra']['raw_info']['samaccountname']
  end
end
