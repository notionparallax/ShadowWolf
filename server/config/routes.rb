ShadowWolf::Application.routes.draw do
  get "typeahead_results" => 'typeahead_results#fetch'

  get "projects/numbers" => "projects#numbers"
  resources :projects

  devise_for :people, :controllers => { :omniauth_callbacks => "people/omniauth_callbacks" }
  devise_scope :person do
    get "sign_in", :to => "devise/sessions#new"
  end

  get "people/logins" => "people#logins"
  resources :people
end
