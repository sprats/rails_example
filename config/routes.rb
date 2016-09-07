Rails.application.routes.draw do
  get 'welcome/index'

  get "tag/:tag" => "articles#tag"

  resources :articles do
  	resources :comments
  end

  root 'welcome#index'

end
