Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    get 'favorites', :on => :member
    resources :contacts, only: [:index]
    resources :contact_groups, only: [:index] do
      get 'contacts', :on => :member
    end
  end

  resources :contacts, only: [:create, :destroy, :show, :update] do
    patch 'toggle_favorite', :on => :member
  end

  resources :contact_shares, only: [:create, :destroy, :index, :show, :update] do
    patch 'toggle_favorite', :on => :member
  end
end
