class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

	def create
		Rails.logger.warn params["content"]
		Rails.logger.warn params["content"]
		Rails.logger.warn params["content"]
		Rails.logger.warn params["content"]
		Rails.logger.warn params["content"]
		Rails.logger.warn params["content"]
		@question = Question.new(question_params)

		if @question.save
	  	redirect_to survey_url(params[:survey_id])
		else
			render 'new'
		end
	end

	private
    def question_params
		  params.permit(:content, :survey_id)
		end

end
