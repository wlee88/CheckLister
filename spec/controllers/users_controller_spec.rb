require 'spec_helper'

describe UsersController do
  render_views
  describe 'GET' do
    describe "new" do
      get :new
      response.should be_success
    end
    
    describe "edit" do
      @user = Factory(:user)
      get :edit, :id => @user
      response.should render_template(edit_user_path)
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
