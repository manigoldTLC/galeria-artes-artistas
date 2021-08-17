Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      scope 'artists/' do
        get 'index_artists', to: 'artists#index'
        get 'show/:id', to: 'artists#show'
        post 'create', to: 'artists#create'
        put 'update/:id', to: 'artists#update'
        delete 'destroy/:id', to: 'artists#destroy'
      end
    end
  end

      scope 'users/' do
        get 'index', to: 'users#index'
        post 'create', to: 'users#create'
        patch 'update/:id', to: 'users#update'
        get 'show/:id', to: 'users#show'
        delete 'delete/:id', to: 'users#delete'
        post 'login', to: 'users#login'
        post 'logout', to: 'users#logout'
      end

    namespace 'api' do
      namespace 'v1' do
        scope 'paintings/' do
          get 'index', to: 'paintings#index'
          post 'create', to: 'painting#create'
          patch 'update/:id', to: 'painting#update'
          get 'show/:id', to: 'painting#show'
          delete 'destroy/:id', to: 'painting#delete'
        end
    end
  end
end