class QuestionsController < ApplicationController

  def new
		@question = Question.new
		puts "\n\n\n\n\n\n\n\n"
		@question[:survey_id] = params[:survey_id]
		puts @question.inspect
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

	private
    def question_params
			params.required(:content)
			params.permit(:survey_id, :content)
		end

end
