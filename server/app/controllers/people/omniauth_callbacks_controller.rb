require 'uri'
class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ldap
    @person = Person.where( 'employee.login' => auth_login ).first
    if @person#.persisted?
      #sign_in_and_redirect @person, :event => :authentication
      login_and_redirect @person
    else
      info = auth_hash['info']
      p = Person.new
      p.employee = Employee.new
      p.employee.login = auth_login
      p.name = PersonName.new first: info['first_name'], last: info['last_name'], preferred_first: info['first_name'], preferred_last: info['last_name']
      p.conditions << Condition.new(name: 'Active')
      p.contact = PersonContact.new
      p.employee.contact = EmployeeContact.new work_email: info['email']
      p.employee.biography = Biography.new
      p.save
      login_and_redirect p
    end
  end

  def failure
    if params[:redirect_uri]
      redirect_to "#{params[:redirect_uri]}?message=Invalid%20password%20or%20username."
    end
  end
    
  protected
  def login_and_redirect person
    apiKey = ApiKey.create person: person
    sign_in person
    redirect_to  add_params(params[:redirect_uri], apiKey.access_token, person.id), status: 303
    set_flash_message(:notice, :success, :kind => "LDAP") if is_navigational_format?
  end

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
