class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
		render :json => @surveys.to_json
	end

	def show
		@survey = Survey.includes(:intervals).find(params[:id])
		render :json => @survey.as_json(include: :intervals) .to_json
	end

	def new
		@survey = Survey.new
	end

	def edit
		@survey = Survey.find(params[:id])
	end

	def create
		@survey = Survey.new(survey_params)

		if @survey.save
			redirect_to @survey
		else
			render 'new'
		end
	end
	
	def update
		@survey = Survey.find(params[:id])

    if params[:survey][:is_active]
      deactivate_all_surveys
    end
	   
		if @survey.update(survey_params)
		  redirect_to @survey
		else  
		  render 'edit'
		end
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
			params.require(:survey).permit(:title, :description, :is_active)
		end
	
end
