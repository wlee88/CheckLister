require 'spec_helper'

describe ChecklistsController do
  render_views
    
    describe "GET" do
      describe "new" do
        before(:each) do
          get :new
        end
        it "should be successful" do
          response.should be_success
        end
        
      end
      
      describe "edit" do
        it "should be successful" do
          @checklist = Factory(:checklist)
          get :edit, :id => @checklist
          response.should be_success
          response.should render_template('edit')
        end
      end
      
      describe "show" do
        it "should be successful" do
          @checklist = Factory(:checklist)
          get :show, :id => @checklist
          response.should be_success
        end
      end
      
    end
    
    describe "POST" do
      before(:each) do
         @attr = { :title => "some title",
            :description => "some description of a checklist",
            :owner => Factory(:user) 
            }
      end
      
      describe 'create' do
        describe 'success' do
          it "should create a new checklist" do
            lambda do
              post :create, :checklist => @attr
              response.should redirect_to(checklists_path)
            end.should change(Checklist, :count).by(1)
            
          end #it should create a new checklist end
        end #success
        
        describe 'failure' do
          it 'should now create a new checklist' do
            @attr = { :owner => nil, :title => ""} #purposefully bad validations
            lambda do
              post :create, :checklist => @attr
              response.should_not redirect_to(checklists_path)
              response.should render_template('new')
            end.should_not change(Checklist, :count).by(1)
          end
        end
      end #end create
      
      describe 'update' do
        
      end #update end
    end
    

   describe "DELETE 'destroy'" do
     
   end
    
end
