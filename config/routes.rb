Rails.application.routes.draw do
  namespace :v1 do
    resources :posts, except: %i(new edit) do
      resources :images, only: %(create destroy)
      resources :comments, only: %(index create destroy)
    end
  end
end
