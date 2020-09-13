Rails.application.routes.draw do
  resources :patients do
    collection { post :import }

  end

  root to: 'patients#index'
  

end
