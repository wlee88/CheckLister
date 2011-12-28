class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
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

