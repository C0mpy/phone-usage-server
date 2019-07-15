Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "surveys#new"

  resources :surveys, only: [:index, :show, :update, :create] do
    resources :questions, only: [:index, :create]
  end

  resources :questions, only: [:show, :update]

  resources :question_responses
  resources :survey_results

  get '/active-surveys', to: 'surveys#get_active'

end
