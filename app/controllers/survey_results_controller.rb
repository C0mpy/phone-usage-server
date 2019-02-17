class SurveyResultsController < ApplicationController

	def index
		@survey_results = SurveyResult.all
	end

	skip_before_action :verify_authenticity_token
	def create
		survey = Survey.find(params[:survey_id])
		survey_result = SurveyResult.new(survey: survey)
		survey_result.save
		question_responses = []
		params[:question_responses].each { |qr|
			question = Question.find(qr[:question_id])
			response = qr[:response]

			question_response = QuestionResponse.new(response: response, 
				question: question, survey_result: survey_result)
			question_response.save
		}
	end

	def show
		survey_result_id = params[:id]
		survey_result = SurveyResult.find(survey_result_id)
		@survey = Survey.find(survey_result[:survey_id])
		@question_responses = QuestionResponse.where(survey_result_id: survey_result_id)

		puts "\n\n\n\n"
		@question_responses.each { |qr|
			qr.question = Question.find(qr.question_id)
		}

	end
	
	def survey_result_params
		params.permit(:survey_id, :question_responses)
	end
	
end
