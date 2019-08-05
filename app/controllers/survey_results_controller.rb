class SurveyResultsController < ApplicationController

	def index
		@survey_results = SurveyResult.all
	end

	skip_before_action :verify_authenticity_token
	def create
		req_survey_result = params.require("survey_result").permit("id", "uuid", "survey_id", "question_responses": [])
		survey_result = SurveyResult.find_by("survey_id": req_survey_result["survey_id"], "uuid": req_survey_result["uuid"])
		puts survey_result.inspect
		if survey_result.nil?
			survey_result = SurveyResult.create!(req_survey_result)
		else
			
			Interval.where(survey_result_id: survey_result.id).destroy_all
		end
		create_intervals(survey_result)
	end

	private
	def create_intervals(survey_result)
		req_intervals = params["intervals"] 
		req_intervals.each { |interval|
			Interval.create!(
				start_time: Time.at(interval["start_time"].to_i/1000), 
				end_time: Time.at(interval["end_time"].to_i/1000),
				survey_result_id: survey_result.id) 
		}
	end






	def show
		survey_result_id = params[:id]
		survey_result = SurveyResult.find(survey_result_id)
		@survey = Survey.find(survey_result[:survey_id])
		@question_responses = QuestionResponse.where(survey_result_id: survey_result_id)

		@question_responses.each { |qr|
			qr.question = Question.find(qr.question_id)
		}

	end

	private
	def survey_result_params
		params.permit("id", "uuid", "survey_id", "question_responses": [])
	end
	
end
