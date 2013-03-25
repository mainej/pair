Pair::Application.routes.draw do
  resources :pairing_requests, only: :create
  root to: 'welcome#index'
end
