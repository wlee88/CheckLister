require 'spec_helper'

describe Item do
  describe "associations" do
    
    before(:each) do
      @item = Item.new
    end
    
    it "should respond to 'title'" do
      @item.should respond_to(:title)
    end
    
    it "should respond to 'complete'" do
      @item.should respond_to(:complete)
    end
    
    describe "Relations" do
      
      it "should respond to 'checklist'" do
          @item.should respond_to(:checklist)
      end
      
      
    end
    
    describe "Validations" do
      before(:each) do
        @item = Item.new(:title => Faker::Lorem.sentence(1), :complete => false,
        :checklist => Factory(:checklist))
      end
      
      it "should not allow a blank title" do
        @item.title = ""
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
    end
    
  end
end


# == Schema Information
#
# Table name: items
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  complete     :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  checklist_id :integer
#

