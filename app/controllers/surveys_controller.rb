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
		req_survey = params.require("survey").permit("title", "description")
		survey = Survey.create(req_survey)
		if params["survey"]["intervals"].any?
			req_interval = params["survey"].require("intervals").first.permit("id", "start_time", "end_time")
			interval = Interval.create(req_interval)
			SurveyInterval.create(survey: survey, interval: interval)
		end
		render :json => survey.as_json(include: "intervals").to_json	
	end

	def get_active
		survey_intervals = SurveyInterval.all
		surveys = []
		for survey_interval in survey_intervals do
			interval = Interval.find(survey_interval.interval_id)
			if interval.start_time.past? and (interval.end_time == nil or interval.end_time.future?)
				surveys << Survey.includes("intervals", "questions").find(survey_interval.survey_id)
			end			
		end
		render :json => surveys.as_json(include: "intervals", include: "questions").to_json
	end

	private 
	def survey_params
		params.require(:survey).permit(:title, :description, {intervals: [:start_time, :end_time]})
	end

	
end
