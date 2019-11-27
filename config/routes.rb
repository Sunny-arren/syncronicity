Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'jpcities#search'
  resources :jpcities do
    collection do
      get 'search'
    end
  end
  resources :chcities do
    collection do
      get 'search'
    end
  end
end