class SurveyResultsController < ApplicationController

	def index
		@surveys = Survey.all
	end

	skip_before_action :verify_authenticity_token
	def create
		puts params
		@survey_result = SurveyResult.new(survey_result_params)
		@survey_result.save
	end

	
	def survey_result_params
		params.require(:survey_result).permit(:survey_id, :user_uuid)
	end
	
end
