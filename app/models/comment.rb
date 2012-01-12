class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  
  validates :content, :presence => true, :length => { :within => 2..1000 }
  validates :user_id, :presence => true
  validates :list_id, :presence => true
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  content    :text
#  user_id    :integer
#  list_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

