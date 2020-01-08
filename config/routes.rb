Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'jpcities#search'
  resources :jpcities do
    collection do
      get 'search' 
      get 'search_result'
    end
  end
  resources :chcities do
    collection do
      get 'search' 
      get 'search_result'
    end
  end
  resources :jpclimates do
    collection do
      get 'search' 
      get 'search_result'
    end
  end
  resources :chclimates do
    collection do
      get 'search' 
      get 'search_result'
    end
  end
end
