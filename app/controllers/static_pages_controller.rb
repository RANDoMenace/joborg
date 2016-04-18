class StaticPagesController < ApplicationController
  def home
  	@jobsearch = current_user.jobsearches.build if logged_in?
  end

  def help
  end

  def about 
  end

  def contact
  end
end
