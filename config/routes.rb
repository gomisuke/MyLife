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
  get 'chart/study' => 'users#chart_study', as: 'chart_study'
  get 'chart/sleeping' => 'users#chart_sleeping', as: 'chart_sleeping'
  get 'chart/exercise' => 'users#chart_exercise', as: 'chart_exercise'
  get 'customs/management' => 'customs#management'
  resources :customs
  post 'task_complete/:id' => 'custom_records#create', as: 'task_complete'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  get 'search/post' => 'posts#post_search', as: 'post_search'
  resources :genres
  resources :diaries
  resources :lives
  resources :life_recodes
  resources :inquiries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
