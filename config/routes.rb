Rails.application.routes.draw do
  devise_for :users
  get 'quests/index'

  root 'quests#index'
end
