Rails.application.routes.draw do
  get 'search_patron/search'
  get 'search_patron/results'
  get 'search_res/search'
  get 'search_res/results'
  get 'search_res/checkout'
  get '/search' => 'search_res#search', :as => 'search_page'
  get 'welcome/index'
  root 'welcome#index'
  resources :books do
    resources :reviews
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
