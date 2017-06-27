Rails.application.routes.draw do
  resources :sections do
    resources :lessons
  end  
end
