class User < ActiveRecord::Base
  has_many :checklists
  has_many :comments
  
  has_many :collaborations
  has_many :items, :through => :collaborations
  
  has_many :checklist_accessors, :dependent => :destroy
  has_many :checklists, :through => :checklist_accessors

  validates :username, :presence => true
  
 
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

