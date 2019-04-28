class UserResultsController < ApplicationController

	def index
		@user_uuids = UserResult.distinct.pluck(:user_uuid)
		@user_results = []

		@user_uuids.each { |uuid|
			sql = "SELECT sum(pu.end_time - pu.start_time) 
				   FROM user_results ur JOIN phone_usages pu on ur.id = pu.user_result_id
				   WHERE user_uuid = '" + uuid + "'"

			total_time_spent_on_phone = ActiveRecord::Base.connection.execute(sql).values[0][0]
			@user_results << {user_uuid: uuid, total_time_spent_on_phone: total_time_spent_on_phone}

			puts @user_results.inspect
		}
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
			puts Time.at(pu["start_time"].to_i/1000).inspect
			puts Time.at(pu["end_time"].to_i/1000).inspect
			user_result.phone_usages.create(start_time: Time.at(pu["start_time"].to_i/1000), end_time: Time.at(pu["end_time"].to_i/1000))
		}

		render status: 200, json: @controller.to_json
	end

	def show
		@user_results = UserResult.includes(:phone_usages).where(user_uuid: params[:user_uuid])
		@user_results_json = @user_results.as_json(include: :phone_usages)

		@phone_usage_micro_intervals = []
		@user_results.each { |user_result|
			@phone_usage_micro_intervals.concat(user_result.phone_usages);
		}
	end
	
end