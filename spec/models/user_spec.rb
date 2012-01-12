require 'spec_helper'

describe User do
  describe 'associations' do
    before(:each) do
      @user = User.new
    end
    
    it "should respond to 'username'" do
      @user.should respond_to(:username)
    end
    
  end 
    
  describe "relationships" do
    before(:each) do
      @user = User.new
    end
      it "should respond to 'list'" do
        @user.should respond_to(:checklists)
      end
        
      it "should respond to 'comments'" do
        @user.should respond_to(:comments)
      end    
      
      it "should respond to 'items'" do
        @user.should respond_to(:items)
      end
  end #relationships end
  
  describe "validations" do
    before(:each) do
      @user = User.new(:username => Faker::Name.first_name)
    end
    
    it "should not allow a blank username" do
      @user.username = ""
      @user.should_not be_valid
    end
    
    it "should only allow unique names" do
      @user = Factory(:user)
      @user2.username = @user.username
      @user2.should_not be_valid
    end
  end
  
  describe "method functionality" do
    it "should reveal the tasks that have not been completed by other users" do
      @user = Factory(:user)
      @user.
    end
    
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

