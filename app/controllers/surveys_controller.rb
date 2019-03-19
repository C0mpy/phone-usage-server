class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
	end

	def show
		@survey = Survey.find(params[:id])
	end

	def new
		@survey = Survey.new
	end

	def edit
		@survey = Survey.find(params[:id])
	end

	def create
		@survey = Survey.new(survey_params)

		if @survey.is_active
			deactivate_all_surveys
		end

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

		def deactivate_all_surveys
			sql = 'UPDATE surveys SET is_active = false'
			ActiveRecord::Base.connection.execute(sql)
		end
	
end
