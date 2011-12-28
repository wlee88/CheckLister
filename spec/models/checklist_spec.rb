require 'spec_helper'

describe Checklist do
  describe "associations" do
    
    before(:each) do
      @checklist = Checklist.new
    end
    
    it "should respond to title" do
      @checklist.should respond_to(:title)
    end
    
    it "should respond to description" do
      @checklist.should respond_to(:description)
    end
    
      describe "relations" do
        it "should respond to items" do
          @checklist.should respond_to(:items)
        end

        it "should respond to comments" do
          @checklist.should respond_to(:comments)
        end

        it "should respond to owner" do
          @checklist.should respond_to(:owner)
        end
        
        it "should respond to 'users'" do
          @checklist.should respond_to(:users)
        end
      end
      
  end
  
  describe "validiations: " do
    before (:each) do
      @checklist = Checklist.new(:title => Faker::Lorem.sentence(1),
       :description => Faker::Lorem.sentence(5), :owner => Factory(:user))
    end
    it "should not allow a blank title" do
      @checklist.title = ""
      @checklist.should_not be_valid
    end
    
    it "should not allow a blank description" do
      @checklist.description = ""
      @checklist.should_not be_valid
    end
    
    it "should have an owner assigned" do
      @checklist.owner = nil
      @checklist.should_not be_valid
    end
  end
  
  describe "checklist items association" do
    it "should allow multiple items" do
      @user = Factory(:user)
      @attr1 =  {:title => "item1", :complete => true, :owner => @user}
      @attr2 = {:title => "item2", :complete => false, :owner => @user}
      @attr3 = {:title => "item3", :complete => true, :owner => @user }
      @checklist.items.build(@attr1)
      @checklist.items.build(@attr2)
      @checklist.items.build(@attr3)
    
      @checklist.items.should have(3).records
      @user.checklists.should have(1).record
      Checklist.should have(1).record
      Item.should have(3).records
    end
    
    
  end
  
end


# == Schema Information
#
# Table name: checklists
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  item_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  owner       :integer
#

