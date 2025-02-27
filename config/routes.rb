Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1  do
      resources :readings
    end
  end

  resources :readings
  resources :messages
  resources :assignment_items
  resources :work_items
  resources :team_assignments
  resources :photos

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'
  
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get 'dashboard', to: 'welcome#dashbroad'
  get 'calendar', to: 'welcome#calendar'
   
  get '/service-worker.js', to: 'service_workers/workers#index'
  get '/manifest.json', to: 'service_workers/manifests#index'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :works do
      get :rollback
    end
    resources :assignees
    resources :defects

    resources :locations
    resources :assignments do  
      collection do
        get :calendar
        post :import           
      end
      member do 
          put :calendar_update  
          delete :delete_uploadfile
      end

      resource :download, only: [:show] 
      member do
          put :ask            #-> assignements/:id/start 
          put :askRequestInfo
          put :askWorkInfo
          put :approve            #-> assignements/:id/start 
          put :cancel            #-> assignements/:id/start 
          put :start            #-> assignements/:id/start 
          put :assign           #-> assignements/:id/finish
          put :quote            #-> assignements/:id/finish
          put :finish           #-> assignements/:id/finish
          put :accept           #-> assignements/:id/accept
          put :reject           #-> assignements/:id/reject
          put :acknowledge      #-> assignements/:id/acknowledge
          put :complete         #-> assignements/:id/complete 
        end
      resources :photos, only: [:create, :destroy] do 
        collection do
          post :create             #-> domain.com/assignments/:id/create
          post :create_general     #-> domain.com/assignments/:id/create
          post :create_before    
          post :create_after    
          post :insert           
        end
        member do
          put  :switch_printable     #-> domain.com/orders/:id/delete+photo
        end
      end
    end
    resources :masters do
      collection { post :import }
    end
    resources :tickets
    resources :teams do
      resources :messages
      member do
        get :chat
        patch :switch
      end
      resources :members, path: :users, module: :teams 
    end

    resources :members
    
    devise_for :users,  controllers: { sessions: "users/sessions" } 
    devise_scope :user do
      scope :users, as: :users do
        post 'pre_otp', to: 'users/sessions#pre_otp'
      end
    end
    resource :two_factor

    get :protected, to: 'welcome#protected'
    root 'welcome#index'
  end
end
