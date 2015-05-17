Rails.application.routes.draw do
  namespace :v1 do
    resources :posts, except: %i(new edit) do
      resources :images, only: %i(create destroy)
      resources :comments, only: %i(index create destroy)
    end
  end

  root to: 'v1/posts#index'
end
