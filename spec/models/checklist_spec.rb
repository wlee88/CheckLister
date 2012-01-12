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
  
  describe "validations: " do
    before (:each) do
      @checklist = Checklist.new(:title => Faker::Lorem.sentence(1),
       :description => Faker::Lorem.sentence(5), :owner => Factory(:user))
    end
    describe "nil validatons" do
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
    
    describe "length validations" do
      it "should not allow title that is too short" do
        @checklist.title = "."
        @checklist.should_not be_valid
      end
      
      it "should not allow a title that is far too long" do
        @checklist.title = "c" * 50
        @checklist.should_not be_valid
      end

      
      it "should not allow a description that is far too long" do
        @checklist.description = "c" * 5000
        @checklist.should_not be_valid
      end
    end
    
  end
  
  describe "checklist items association" do
    before(:each) do
      @checklist = Factory(:checklist)
      @item1 =  {:content => "item1", :complete => true, :owner => @user}
      @item2 = {:content => "item2", :complete => false, :owner => @user}
      @item3 = {:content => "item3", :complete => true, :owner => @user }
      @checklist.items.build(@item1)
      @checklist.items.build(@item2)
      @checklist.items.build(@item3)
    end
    
    it "should allow multiple items" do
      @user = Factory(:user)
      @checklist.owner = @user
      @checklist.save

      @checklist.items.should have(3).records
      @user.checklists.should have(1).record
      Checklist.should have(1).record
      Item.should have(3).records
    end
    
    it "should have 5 users linked(permitted access)" do
      
      
      @user = Factory(:user)
      @user2 = Factory(:user)
      @user3 = Factory(:user)
      
      @checklist.users << [@user, @user2, @user3]
      @checklist.save! 
      
      @checklist.users.should have(3).records
      Checklist.shoud have(1).record
      User.should have(3).records
      
      @user.checklists.should have(1).record
      @user2.checklists.should have(1).record
      @user3.checklists.should have(1).record

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
#  owner_id    :integer
#

