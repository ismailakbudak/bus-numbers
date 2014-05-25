BusNumbers::Application.routes.draw do
   

  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :products
  resources :users do
    collection do
      patch 'update_password'
    end
  end

  scope "(:locale)", :locale => /en|tr/ do
    root  'static_pages#home'
    match '/help',    to: 'static_pages#help',    via: 'get'
    match '/about',   to: 'static_pages#about',   via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get'
    match '/signup',  to: 'users#new',            via: 'get'

    match '/password', to: 'users#edit_password', via: 'get'    
    #for session
    match '/signin',  to: 'sessions#new',         via: 'get'
    match '/signout', to: 'sessions#destroy',     via: 'delete'

  end

end
