class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new
  end
end
