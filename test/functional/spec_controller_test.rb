require 'test_helper'

class SpecControllerTest < ActionController::TestCase
  fixtures :users
  fixtures :specs
  
  def setup
    @controller = SpecController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @user = users(:valid_user)
    @spec = specs(:valid_spec)
  end
  
  def test_edit_success
    authorize @user
    post :edit, :spec => { :first_name => "new first name",
                            :last_name => "new last name",
                            :gender => "Male",
                            :occupation => "new job",
                            :zip_code => "91125"}
    spec = assigns(:spec)
    new_user = User.find(spec.user.id)
    #raise spec.user.id.inspect
    assert_equal new_user.spec, spec 
    assert_equal "Changes saved.", flash[:notice]
    assert_response :redirect
    assert_redirected_to :controller => "user", :action => "index"
  end
end
