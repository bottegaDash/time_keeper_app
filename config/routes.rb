Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "/task/all", to: "task#all"
end
