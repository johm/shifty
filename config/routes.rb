Rails.application.routes.draw do
  resources :milestones
  devise_for :users
  resources :milestone_accomplishments
  resources :week_notes
  resources :transactions
  resources :shift_templates
  resources :pay_rates
  resources :shifts do 
    collection do
      get 'report'
    end
    member do
      post 'colorfix'
      put 'makeunavail'
    end
  end

  resources :tasks do 
    member do 
      get 'report'
    end
  end

  resources :workgroups do 
    member do 
      get 'report'
    end
  end

  resources :workers do 
    member do 
      get 'report'
      get 'capital'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'weeks#current'
  get 'weeks/:monday' => 'weeks#show'
  post 'weeks/:monday/apply_shift_template' => 'weeks#apply_shift_template'



  resources :users
  get 'me' => 'workers#me'
  get 'calendar/:id/:secretslug' => 'calendar#show'

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
