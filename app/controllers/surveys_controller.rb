class SurveysController < ApplicationController

	def index
	end

	def new
	end

	def create
		render plain: params[:survey].inspect
	end
	
end
