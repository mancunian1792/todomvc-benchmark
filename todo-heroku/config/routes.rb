Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :user, only: [] do
    get 'logout'
    resource :account, only: [] do
      get 'info', :to => 'users#info'
    end
  end

  post '/login',  :to => 'users#login'
  post '/signup', :to => 'users#signup'

  scope :api do
    namespace :v1 do
      resource :table, only: [] do
        resource :todo, only: [] do
          post 'select'
          post 'insert'
          post 'update'
          post 'delete'
          post 'delete_completed'
          post 'toggle_all'
        end
      end
    end
  end

  root to: 'application#index'

end
