class QuestionsController < ApplicationController
	protect_from_forgery prepend: true

  def new
		@question = Question.new
		@question[:survey_id] = params[:survey_id]
		render 'new'
  end

	def create
		@question = Question.new(question_params)

		if @question.save
	  	redirect_to survey_url(params[:survey_id])
		else
			render 'new'
		end
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
