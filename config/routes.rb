Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :ideas, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
  resources :ideas do
    resources :reviews, only: [:create,:destroy], shallow: true
  end
  resources :users, only: [:new, :create]

get('/',{to: 'ideas#index', as: :root})

end
