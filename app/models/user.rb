class User < ActiveRecord::Base
  has_many :checklists
  has_many :comments
  
  has_many :attendances, :dependent => :destroy
  has_many :items, :through => :attendances

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

