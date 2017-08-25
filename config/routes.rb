Rails.application.routes.draw do
    devise_for :users
    root 'tweets#index'
    resources :tweets do
        resources :comments
        resources :users do
            resources :emojitweets
        end
    end
    resources :emojitweets
end
