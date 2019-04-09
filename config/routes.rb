Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "user_results#index"

  resources :surveys do
    resources :questions
  end

  resources :question_responses
  resources :survey_results
  resources :user_results, only: [:index, :create]

  get '/active-survey', to: 'surveys#get_active'
  get '/users/:user_uuid/user-results', to: 'user_results#show', as: 'user_results_for_user'

end
