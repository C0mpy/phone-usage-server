Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "user_results#index"

  resources :surveys do
    resources :questions
  end

  get '/active-survey' => 'surveys#get_active'

  resources :question_responses
  resources :survey_results
  resources :user_results

end
