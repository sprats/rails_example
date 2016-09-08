Rails.application.routes.draw do
  get 'welcome/index'

  get 'tag/:tag' => 'articles#tag', as: 'tag'

  resources :articles do
  	resources :comments
  end

  root 'articles#index'

end
