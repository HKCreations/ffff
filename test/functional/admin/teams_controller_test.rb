require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/team_controller'

# Re-raise errors caught by the controller.
class Admin::TeamsController; def rescue_action(e) raise e end; end

class Admin::TeamsControllerTest < Test::Unit::TestCase
  def setup
    @controller = Admin::TeamsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end