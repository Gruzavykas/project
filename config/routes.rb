Rails.application.routes.draw do
  post "/articles/new" => 'articles#create'
  resources :articles

  root 'articles#new'

end
