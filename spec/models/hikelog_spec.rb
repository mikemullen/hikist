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

require 'spec_helper'

describe Hikelog do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  	@hikelog = user.hikelogs.build(content: "Lorem ispsum", title: "Lorem",
  							location: "Tahoe", date_of_hike: "2013,5,10",
  							length_of_hike: "10.5", elevation_change: 1000)
  end

  subject { @hikelog }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:location) }
  it { should respond_to(:date_of_hike) }
  it { should respond_to(:length_of_hike) }
  it { should respond_to(:elevation_change) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @hikelog.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Hikelog.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end