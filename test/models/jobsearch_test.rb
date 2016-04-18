require 'test_helper'

class JobsearchTest < ActiveSupport::TestCase
  
  def setup
  	@user = users(:michael)
  	@jobsearch = @user.jobsearches.build(company: "Hulu", 
  							   			 role: "Ruby Developer",
  							   			 description: "5+ year experienced Roby on Rails developer needed ASAP.",
  							   			 job_post: "Glassdoor.com",
  							   			 recruiter: "NA",
  							   			 notes: "Really want this!!!",
  							   			 user_id: @user.id)
  end

  test "should be valid" do
  	assert @jobsearch.valid?
  end

  test "user id should be present" do
  	@jobsearch.user_id = nil
  	assert_not @jobsearch.valid?
  end

  test "company should be present" do
  	@jobsearch.company = "    "
  	assert_not @jobsearch.valid?
  end

  test "company should be at most 50 characters" do
  	@jobsearch.company = "a" * 51
  	assert_not @jobsearch.valid?
  end

  test "role should be present" do 
  	@jobsearch.role = "    "
  	assert_not @jobsearch.valid?
  end

  test "role should be at most 50 characters" do 
  	@jobsearch.role = "a" * 51
  	assert_not @jobsearch.valid?
  end

  test "description should be present" do
  	@jobsearch.description = "    "
  	assert_not @jobsearch.valid?
  end

  test "order should be most recent first" do
  	assert_equal jobsearches(:most_recent), Jobsearch.first
  end
end
