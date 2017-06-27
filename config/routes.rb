Rails.application.routes.draw do
  resources :lessons
  resources :sections do
    resources :lessons
  end
end
