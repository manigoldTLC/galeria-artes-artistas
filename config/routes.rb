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
end
