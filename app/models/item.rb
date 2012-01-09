class Item < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :owner, :class_name => 'User'
  
  has_many :attendances, :dependent => :destroy
  has_many :users, :through => :attendances
  
  validates :content, :presence => true, :length => { :maximum => 7000 }
  
  def complete?(user)
    self.attendances.find_by_user_id(user).complete
  end
  
  def set_true(user)
    @attendance =  self.attendances.find_by_user_id(user)
    @attendance.complete = true
    @attendance.save
  end
  
  def set_false(user)
    @attendance =  self.attendances.find_by_user_id(user)
    @attendance.complete = false
    @attednance.save
    
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

