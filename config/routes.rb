Rails.application.routes.draw do
  namespace :v1 do
    resources :posts, except: %i(new edit) do
      resources :images, only: %i(create destroy)
      resources :comments, only: %i(index create destroy)
    end

    resources :reports, only: %i(new)
  end

  root to: 'v1/reports#new'
end
