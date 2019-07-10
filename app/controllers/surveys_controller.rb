class SurveysController < ApplicationController
	protect_from_forgery prepend: true  

	def index
		surveys = Survey.includes("intervals").all
		render :json => surveys.as_json(include: "intervals").to_json
	end

	def show
		id = params.require("id")
		survey = Survey.includes("intervals").find(id)
		render :json => survey.as_json(include: "intervals").to_json
	end
	
	def update
		id = params.require("id")
		req_survey = params.require("survey").permit("title", "description")
		survey = Survey.find(id)
		survey.update(req_survey)
		if params["survey"]["intervals"].any?
			req_interval = params["survey"].require("intervals").first.permit("id", "start_time", "end_time")
			existing_interval = Interval.find(req_interval["id"])
			existing_interval.update(req_interval)
		end
		render :json => survey.as_json(include: "intervals").to_json	
	end

	def create
		survey = Survey.create(survey_params.except("intervals"))
		if survey_params["intervals"].any?
			interval = survey_params["intervals"].first
			interval = Interval.create(interval)
			SurveyInterval.create(survey: survey, interval: interval)
		end
		render :json => survey.as_json(include: "intervals").to_json	
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
		params.require(:survey).permit(:title, :description, {intervals: [:start_time, :end_time]})
	end

	
end
