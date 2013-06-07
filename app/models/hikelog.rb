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
  validates :content, :user_id, :title, :date_of_hike, presence: true
  validates :content, length: { maximum: 1000,
  			tokenizer: lambda { |str| str.scan(/\w+/) },
  			too_long: "must have at most %{count} words"
  }
  validates :title, :location, length: { maximum: 100 }
  validates :length_of_hike, :elevation_change, numericality: true
  default_scope order: 'hikelogs.date_of_hike DESC'

  def self.from_users_followed_by(user)
    leader_ids = "SELECT leader_id FROM relationships
                 WHERE follower_id = :user_id"
    where("user_id IN (#{leader_ids}) OR user_id = :user_id",
          user_id: user)
  end
end