Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', 
                                    registrations: 'users/registrations', 
                                    passwords: 'users/passwords'
                                  }
  
  devise_scope :user do
    root to: 'users/sessions#new'
  end

  resources :user , only: [] do
    resources :todo_items, only: [:index, :new, :create] 
  end

  resources :todo_items, only: [:show, :edit, :update, :destroy]  do
    collection do
      patch :sort
    end
    member do
      patch :complete       
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
