Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions'
  }
  resource :users
  get 'mypage/diary' => 'users#mypage_diary', as: 'mypage_diary'
  get 'mypage/post' => 'users#mypage_post', as: 'mypage_post'
  get 'mypage/like' => 'users#mypage_like', as: 'mypage_like'
  get 'customs/management' => 'customs#management'
  resources :customs
  post 'task_complete/:id' => 'custom_records#create', as: 'task_complete'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :genres
  resources :diaries
  resources :lives
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
