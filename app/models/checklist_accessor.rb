class ChecklistAccessor < ActiveRecord::Base
  belongs_to :user
  belongs_to :checklist
  
  validates :user_id, :presence => true
  validates :checklist_id, :presence => true
end

# == Schema Information
#
# Table name: checklist_accessors
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  checklist_id :integer
#

