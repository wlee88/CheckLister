require 'spec_helper'

describe Item do
  describe "associations" do
    
    before(:each) do
      @item = Item.new
    end
    
    it "should respond to 'title'" do
      @item.should respond_to(:content)
    end
    
    it "should respond to 'attendees'" do
      @item.should respond_to(:users)
    end
  end
  
  describe "Relations" do
      
    it "should respond to 'checklist'" do
      @item.should respond_to(:checklist)
    end
      
  end
    
  describe "Validations" do
    
    before(:each) do
      @item = Item.new(:content => Faker::Lorem.sentence(1), :complete => false,
      :checklist => Factory(:checklist), :owner => Factory(:user))
    end
    
    it "should not allow blank content" do
      @item.content = ""
      @item.should_not be_valid
    end
    
    it "should not allow a blank complete" do
      @item.complete = nil
      @item.should_not be_valid
    end
    
    it "should always be assigned to a checklist" do
      @item.checklist = nil
      @item.should_not be_valid
    end
    
    it "should not allow blank content" do
      @item.title = ""
      @item.should_not be_valid
    end
    
    it "should not allow too long a title" do
      @item.title = "h" * 40
      @item.should_not be_valid
    end
    
    it "should not allow content that is waaay tooo long " do
      @item.title = "h" * 200
      @item.should_not be_valid
    end
    
    it "should have an owner assigned" do
      @item.owner = nil
      @item.should_not be_valid
    end
  end #validations end
  
  describe "attendances association" do
    
    before (:each) do
      @item = Factory(:item)
      @user = Factory(:user)
      @user2 = Factory(:user)
      @user3 = Factory(:user)
      @item.users << [@user, @user2, @user3]
      
    end
      
      it "should allow users to be allocated to items" do
        @item.users << [@user, @user2, @user3]
        @item.should be_valid
      end
      
      it "should allow me to check if a user has done a specfic item or not" do
        @item.users.first.should == @user
        @item.complete?(@user).should be_false
      end
      
      it "should be able to set true" do
        @item.set_true(@user)
        @item.complete?(@user).should be_true
      end
      
      it "should be able to set false" do
        @item.set_false(@user)
        @item.complete?(@user).should be_false
      end
      
      it "should toggle boolean" do
        @item.set_true(@user)
        @item.toggle(@user)
        @item.complete?(@user).should be_false
        
        @item.toggle(@user)
        @item.complete?(@user).should be_false
      end
      
    end #attendances assoication
    
    describe "methods" do
      before (:each) do
        @item = Factory(:item)
        @user = Factory(:user)
        @user2 = Factory(:user)
        @user3 = Factory(:user)
        @item.users << [@user, @user2, @user3]
      end
      
      it "'set_true' should set an item to true" do
        @item.set_true(@user)
        @item.complete?(@user).should be_true
      end
      it "'set_false' should set an item to false" do
        @item.set_true(@user)
        @item.complete?(@user).should be_false
      end
      it "'toggle' should toggle a true item to false" do
        @item.set_true(@user)
        @item.toggle(@user).should be_false
      end
      it "'toggle' should toggle a false item to true" do
        @item.set_false(@user)
        @item.toggle(@user).should be_true
      end
    end
    
    describe "scenarios" do
     # it "an item owned by a user has a checklist and adds 3 users to the checklist access list. He wants to see if they a certain user has done the task" do
     #   @user = Factory(:user)
     #   @user.checklists.build(:title => Faker::Lorem.sentence(1), :description => Faker::Lorem.sentence(2))
     #   @user.items.build(:content => Faker::Lorem.sentence(1))
     #   @user.checklists.first.items << 
     # end
      
    end
end




# == Schema Information
#
# Table name: items
#
#  id           :integer         not null, primary key
#  content      :string(255)
#  complete     :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  checklist_id :integer
#  owner_id     :integer
#

