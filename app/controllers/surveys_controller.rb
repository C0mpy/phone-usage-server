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

	private
		def survey_params
			params.require(:survey).permit(:title, :description, :is_active)
		end

		def deactivate_all_surveys
			sql = 'UPDATE surveys SET is_active = false'
			ActiveRecord::Base.connection.execute(sql)
		end
	
end
