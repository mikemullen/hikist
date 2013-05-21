require 'spec_helper'

describe "Hikelog pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "new hikelog page" do
    before { visit new_hikelog_path }

    it { should have_selector('h1',    text: 'Add hikelog') }
    it { should have_selector('title', text: 'Add hikelog') }
  end

  describe "hikelog creation" do
  	before { visit new_hikelog_path }

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

  describe "hikelog show page" do
    before do
      FactoryGirl.create(:hikelog, user: user, title: "Tahoe", content: "foobar", id: 1)
      visit hikelog_path(1)
    end

    it { should have_selector('title',   text: "Tahoe" ) }
    it { should have_selector('p', text: "foobar") }
  end


  describe "hikelog destruction" do
    before { FactoryGirl.create(:hikelog, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it " should delete a hikelog" do
        expect { click_link "delete" }.to change(Hikelog, :count).by(-1)
      end
    end
  end
end