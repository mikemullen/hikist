require 'spec_helper'

describe "Hikelog pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "hikelog creation" do
  	before { visit root_path }

  	describe "with invalid information" do

  	  it "should not create a hikelog" do
  	  	expect { click_button "Post" }.not_to change(Hikelog, :count)
  	  end

  	  describe "error messages" do
  	  	before { click_button "Post" }
  	  	it { should have_content('error') }
  	  end
  	end

  	#test for valid information

  end
end
