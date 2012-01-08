require 'spec_helper'

describe UsersController do
  render_views
  describe 'GET' do
    describe "new" do
      it "should be successful" do
        get :new
        response.should be_success
      end
    end
    
    describe "edit" do
      @user = Factory(:user)
      it "shold be successful" do
        get :edit, :id => @user
        response.should render_template(edit_user_path)
      end
    end
    
    describe "show"do
    end
    
  end
  
  describe "POST" do
    describe "create" do
      
    end
    
    describe "update" do
      
    end
  end
  
  describe "DELETE" do
    
  end
end
