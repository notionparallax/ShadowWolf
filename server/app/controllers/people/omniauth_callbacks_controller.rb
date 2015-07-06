require 'json'
require 'http'
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
      email_ben_about p
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
    redirect_to  add_params(params[:redirect_uri], apiKey.access_token, person.id, person.employee.login || nil), status: 303
    set_flash_message(:notice, :success, :kind => "LDAP") if is_navigational_format?
  end

  def add_params(url, token, person_id, login)
    "#{url}&access_token=#{token}&person_id=#{person_id}" + ( login ? "&login=#{login}" : "")
  end

  def auth_hash
    request.env['omniauth.auth']
  end
  def auth_login
    auth_hash['extra']['raw_info']['samaccountname'].first.to_s
  end

  def email_ben_about person
    body =
      {
        key: ENV['MANDRILL_KEY'],
        message:
          {
            from_email: ENV['MANDRILL_EMAIL'],
            to: [{email:ENV['MANDRILL_EMAIL'],         type:"cc"},
                 {email:p.employee.contact.work_email, type:"to"}],
            autotext: "true",
            subject: "A new user is born - welcome to the phonelist #{person.name.first}!",
            html: "<p>Hello #{person.name.first} #{person.name.last}! </p><p>The phone list is about much more than just phone numbers. It's where (almost) all the information about you is stored. Everything that is related to your CV, your dietary requirements, your business card etc. lives there.</p><p>If you didn't fill it in when you were there before you can <a href='http://phonelist.bvn.com.au:9000/#/people/#{person.employee.login}'>edit yourself by clicking here</a>. In case you forget, your login is #{person.employee.login}.</p><p>The absolute minimum information needed is your extension, a photo and your studio.</p><p>If you need a hand then get in touch with me (Ben Doherty). You can <a href='http://phonelist.bvn.com.au:9000/#/people/bdoherty'>find my details here.</a></p>"
          }
      }
    HTTP.post("https://mandrillapp.com/api/1.0/messages/send.json?key=#{body[:key]}", body: JSON.dump( body ) )
  end
end
