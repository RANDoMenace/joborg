class JobsearchesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@jobsearch = current_user.jobsearches.build(jobsearch_params)
		if @jobsearch.save
			flash[:success] = "Jobsearch created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@jobsearch.destroy
		flash[:success] = "Jobsearch deleted"
		redirect_to request.referrer || root_url
	end

	private

	def jobsearch_params
		params.require(:jobsearch).permit(:company, :role, :description)
	end

	def correct_user
		@jobsearch = current_user.jobsearches.find_by(id: params[:id])
		redirect_to root_url if @jobsearch.nil?
	end
end
