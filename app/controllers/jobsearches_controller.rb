class JobsearchesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@jobsearch = current_user.jobsearches.build(jobsearch_params)
		if @jobsearch.save
			flash[:success] = "Jobsearch created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

	private

	def jobsearch_params
		params.require(:jobsearch).permit(:company, :role, :description)
	end
end
