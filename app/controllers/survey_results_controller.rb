class SurveyResultsController < ApplicationController

	def index
		@survey_results = SurveyResult.all
		puts @survey_results
	end

	skip_before_action :verify_authenticity_token
	def create
		puts params
		@survey = Survey.find(params[:survey_id])
		@survey_result = SurveyResult.new(survey: @survey, user_uuid: survey_result_params[:user_uuid])
		@survey_result.save
	end

	
	def survey_result_params
		params.require(:survey_result).permit(:survey_id, :user_uuid)
	end
	
end
