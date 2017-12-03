Rails.application.routes.draw do
  resources :time do
    get :get_time, on: :collection
    post :set_time, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
