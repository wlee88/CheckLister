class Item < ActiveRecord::Base
  belongs_to :checklist
end


# == Schema Information
#
# Table name: items
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  complete     :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  checklist_id :integer
#

