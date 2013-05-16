# == Schema Information
#
# Table name: hikelogs
#
#  id               :integer          not null, primary key
#  content          :text
#  user_id          :integer
#  title            :string(255)
#  location         :string(255)
#  date_of_hike     :date
#  length_of_hike   :decimal(, )
#  elevation_change :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Hikelog < ActiveRecord::Base
  attr_accessible :content, :date_of_hike, :elevation_change,
  				  :length_of_hike, :location, :title
  belongs_to :user

  validates :user_id, presence: true
  default_scope order: 'hikelogs.date_of_hike DESC'
end