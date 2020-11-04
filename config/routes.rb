Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/test_sign_in' => 'users/sessions#test_sign_in'
  end
  resource :users, only: [:show]
  get 'mypage/diary' => 'users#mypage_diary', as: 'mypage_diary'
  get 'mypage/post' => 'users#mypage_post', as: 'mypage_post'
  get 'mypage/like' => 'users#mypage_like', as: 'mypage_like'
  get 'chart/study' => 'users#chart_study', as: 'chart_study'
  get 'chart/sleeping' => 'users#chart_sleeping', as: 'chart_sleeping'
  get 'chart/exercise' => 'users#chart_exercise', as: 'chart_exercise'
  get 'customs/management' => 'customs#management'
  resources :customs, only: [:index, :create, :destroy]
  post 'task_complete/:id' => 'custom_records#create', as: 'task_complete'
  resources :posts, only: [:new, :index, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  get 'search/post' => 'posts#post_search', as: 'post_search'
  resources :genres, only: [:index, :create, :destroy]
  resources :diaries
  resources :lives, only: [:update]
  resources :life_recodes, only: [:index, :edit, :update]
  resources :inquiries, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
