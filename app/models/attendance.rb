class Attendance < ActiveRecord::Base
    
  validates :item, :presence => true
  validates :user, :presence => true
  
  belongs_to :user
  belongs_to :item
end

# == Schema Information
#
# Table name: attendances
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  item_id    :integer
#  complete   :boolean         default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

