class SurveysController < ApplicationController
	protect_from_forgery prepend: true  

	def index
		@surveys = Survey.includes(:intervals).all
		render :json => @surveys.as_json(include: :intervals).to_json
	end

	def show
		@survey = Survey.includes(:intervals).find(params[:id])
		render :json => @survey.as_json(include: :intervals).to_json
	end
	
	def update
		@survey = Survey.find(params[:id])
		@survey.update(survey_params)
		render :json => @survey.as_json(include: :intervals).to_json		
	end

	def create
		@survey = Survey.create(survey_params)
		render :json => @survey.as_json(include: :intervals).to_json		
	end




	def get_active
		survey = Survey.find_by(is_active: :true)
		questions = Question.select('id, content').where(survey_id: survey.id)
		
		respond_to do |format|
			msg = {id: survey.id, title: survey.title, 
				description: survey.description, questions: questions}
			format.json  { render :json => msg }
		end
	end

	private
	def survey_params
		params.require(:survey).permit(:title, :description, :intervals)
	end

	
end
