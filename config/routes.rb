Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "surveys#new"

  resources :surveys, only: [:index, :show, :update, :create] do
    resources :questions, only: [:index, :create]
    resources :survey_results, only: [:index]
  end

  resources :questions, only: [:show, :update]

  resources :question_responses

  resources :survey_results, only: [:show, :create]

  get '/active-surveys', to: 'surveys#get_active'
  get '/surveys/:id/json', to: 'surveys#json'

end
