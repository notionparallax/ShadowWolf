ShadowWolf::Application.routes.draw do
  resources :preferences

  resources :presses

  resources :dietaries

  resources :event_participations

  resources :office_cultures

  resources :attentions

  resources :socials

  resources :biographies

  resources :project_experiences

  resources :frequent_flier_programs

  resources :passports

  resources :travels

  resources :professional_contributions

  resources :personal_awards

  resources :memberships

  resources :registrations

  resources :qualifications

  resources :finances

  resources :security_clearances

  resources :applications

  resources :applicants

  resources :person_contacts

  resources :employee_contacts

  resources :employee_mobiles

  resources :conditions

  resources :photos

  resources :employees

  resources :person_names

  resources :people

  resources :people do
    resources :person_name
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
