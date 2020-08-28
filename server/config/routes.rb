Rails.application.routes.draw do
  resources :payrolls, only: [:create]
end
