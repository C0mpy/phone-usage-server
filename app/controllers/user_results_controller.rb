class UserResultsController < ApplicationController

	def index
		@user_results = UserResult.all

		puts "\n\n\n\n\n\n\n\n\n\n"
		puts @user_results.inspect
	end

	skip_before_action :verify_authenticity_token
	def create
		survey_result = SurveyResult.find(params[:survey_result_id])

		period_start = Time.at(params[:period_start].to_i/1000)
		period_end = Time.at(params[:period_end].to_i/1000)

		user_result = UserResult.new(survey_result: survey_result, user_uuid: params[:user_uuid],
			period_start: period_start, period_end: period_end)
		user_result.save

		params[:phone_usage].each { |pu|
			user_result.phone_usages.create(start_time: pu[:start_time], end_time: pu[:end_time])
		}

		render status: 200, json: @controller.to_json
	end

	def show
		@user_result_data = []
		@user_result = UserResult.where(user_uuid: params[:user_uuid])
		puts "\n\n\n\n\n\n\n\n\n\n"

		@user_result.each { |ur|
			puts "searching..."

			puts PhoneUsage.where(user_result: ur.id).inspect

			ur.phone_usages << PhoneUsage.where(user_result: ur.id)
			@user_result_data << ur
		}

		puts "\nTOTAL RESULT"
		puts @user_result_data.inspect
	end
	
	def user_result_params
		params.required(:survey_result_id, :user_uuid, :period_start, :period_end)
	end
	
end