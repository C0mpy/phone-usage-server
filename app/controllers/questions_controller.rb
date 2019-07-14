class QuestionsController < ApplicationController
	protect_from_forgery prepend: true

	def index
		questions = Question.where(survey_id: params[:survey_id])
		render :json => questions.to_json
	end

	def show
		question = Question.find(params[:id])
		render :json => question.to_json
	end

	def update
		id = params.require("id")
		req_question = params.require("question").permit("content")
		question = Question.find(id)
		question.update(req_question)
		render :json => question.to_json	
	end

	def create
		survey_id = params.require("survey_id")
		@survey = Survey.find(survey_id)

		req_question = params.require("question").permit("content")
		req_question["survey"] = @survey;
		saved_question = Question.create(req_question)
		render :json => saved_question.to_json
	end

	private
    def question_params
			params.required(:content)
			params.permit(:survey_id, :content)
		end

end
