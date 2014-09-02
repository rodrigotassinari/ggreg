Rails.application.routes.draw do

  namespace :web, path: '', as: '' do
    resources :posts
    get 'signup' => 'signups#new', as: 'signup'
    post 'signup' => 'signups#create'
    get 'login' => 'sessions#new', as: 'login'
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy', as: 'logout'
    root 'posts#index'
  end

  namespace :api, path: 'api', as: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      resources :posts
    end
  end

end
