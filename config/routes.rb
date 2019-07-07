Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "surveys#new"

  resources :surveys, only: [:index, :show, :update] do
    resources :questions
  end

  resources :question_responses
  resources :survey_results

  get '/active-survey', to: 'surveys#get_active'

end
