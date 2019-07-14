class QuestionsController < ApplicationController
	protect_from_forgery prepend: true

	def create
		survey_id = params.require("survey_id")
		@survey = Survey.find(survey_id)

		req_question = params.require("question").permit("content")
		req_question["survey"] = @survey;
		saved_question = Question.create(req_question)
		render :json => saved_question.to_json
	end

	def index
		questions = Question.where(survey_id: params[:survey_id])
		render :json => questions.to_json
	end

	private
    def question_params
			params.required(:content)
			params.permit(:survey_id, :content)
		end

end
