class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new
  end
  
  def edit
    @checklist = Checklist.find(params[:id])
  end
  
  def show
    @checklist = Checklist.find(params[:id])
  end
  
  def create
    @checklist = Checklist.new(params[:checklist])
    if @checklist.save
      flash[:success] = "Checklist Created"
      redirect_to checklists_path
    else
      flash[:error] = "Error in saving checklist"
      render 'new'
    end
  end
end
