require 'spec_helper'

describe Comment do
  describe "associations" do
    before(:each) do
      @comment = Comment.new
    end
    
    it "should respond to 'content'" do
      @comment.should respond_to(:content)
    end
    
    describe "Relations" do
      it "should respond to 'user'" do
        @comment.should respond_to(:user)
      end
      
      it "should respond to 'list'" do
        @comment.should respond_to(:list)
      end
    end
    
    
  end
  
  describe "Validations" do
    before (:each) do
      @comment = Comment.new(:content => Faker::Lorem.sentence(1),
       :user_id => Factory(:user), :list_id => Factory(:checklist))
    end
    it "should not allow nil content" do
      @comment.content = ""
      @comment.should_not be_valid
    end
    
    it "should not allow content that is greater than 1000 characters" do
      @comment.content = "a" * 1000
      @comment.should_not be_valid
    end
    
    it "should have a list assigned" do
      @comment.list_id = nil
      @comment.should_not be_valid
    end
    
    it "should have a user assigned" do
      @comment.user_id = nil
      @comment.should_not be_valid
    end
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  content    :text
#  user_id    :integer
#  list_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

