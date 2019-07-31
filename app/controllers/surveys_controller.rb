class SurveysController < ApplicationController
	protect_from_forgery prepend: true  

	def index
		surveys = Survey.all
		render :json => surveys.to_json
	end

	def show
		id = params.require("id")
		survey = Survey.find(id)
		render :json => survey.to_json
	end
	
	def update
		id = params.require("id")
		req_survey = params.require("survey").permit("title", "description", "start_time", "end_time")
		survey = Survey.find(id)
		survey.update(req_survey)
		render :json => survey.to_json	
	end

	def create
		req_survey = params.require("survey").permit("title", "description", "start_time", "end_time")
		survey = Survey.create(req_survey)
		render :json => survey.to_json	
	end

	def get_active
		surveys = Survey.where("start_time < ? AND end_time is null or end_time > ?", Time.now, Time.now)
		render :json => surveys.as_json(include: "questions").to_json
	end

	private 
	def survey_params
		params.require(:survey).permit(:title, :description, :start_time, :end_time)
	end

	
end
