Rails.application.routes.draw do
  devise_for :users, :skip => :registrations 
  

  resources :patients do
    collection { post :import }

  end

  root to: 'patients#index'
  

end
