Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions'
  }
  resource :users
  get 'customs/management' => 'customs#management'
  resources :customs
  post 'task_complete/:id' => 'custom_records#create', as: 'task_complete'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :genres
  resources :diaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
