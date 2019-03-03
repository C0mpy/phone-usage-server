class UserResultsController < ApplicationController

	def index
		@user_results = UserResult.all
	end

	skip_before_action :verify_authenticity_token
	def create
  
		puts params.inspect
		puts "Saving user_result..."
		logger.fatal "Saving user_result..."
		survey_result = SurveyResult.find(params[:survey_result_id])

		period_start = Time.at(params[:period_start].to_i/1000)
		period_end = Time.at(params[:period_end].to_i/1000)

		user_result = UserResult.new(survey_result: survey_result, user_uuid: params[:user_uuid],
			time_spent_on_phone: params[:time_spent_on_phone], period_start: period_start, 
			period_end: period_end)
		user_result.save
		puts "Saving user_result success..."
		logger.fatal "Saving user_result success..."
		render status: 200, json: @controller.to_json
	end
	
	def user_result_params
		params.required(:survey_result_id, :user_uuid, :time_spent_on_phone, :period_start, :period_end)
	end
	
end
