class Checklist < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :users, :through => :checklist_accesses
  belongs_to :owner, :class_name => 'User'
end


# == Schema Information
#
# Table name: checklists
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  item_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  owner       :integer
#

