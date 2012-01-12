class Item < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :owner, :class_name => 'User'
  
  has_many :collaborations
  has_many :users, :through => :collaborations
  
  validates :content, :presence => true, :length => { :maximum => 100 }
#  validates :owner, :presence => true

  def complete?(user)
    self.attendances.find_by_user_id(user).complete
  end
  
  def set_true(user)
    @attendance =  self.attendances.find_by_user_id(user)
    @attendance.complete = true
    @attendance.save
    self.reload
  end
  
  def set_false(user)
    @attendance =  self.attendances.find_by_user_id(user)
    @attendance.complete = false
    @attendance.save
    self.reload
  end
  
  def toggle(user)
    @attendance = self.attendances.find_by_user_id(user)
    if @attendance.complete = false
      @attendance.complete = true
    else 
      @attendance.complete = false
    end
    @attendance.save
  end
  
  def users_who_have_completed_the_tasks(item)
    @users = @checklist.attendance.find_by_item_id(item)
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

