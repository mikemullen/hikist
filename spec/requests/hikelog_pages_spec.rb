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

    describe "hikelog destruction as correct user" do

      it "should delete a hikelog" do
        expect { click_link "Delete" }.to change(Hikelog, :count).by(-1)
      end
    end
  end

  describe "edit" do
    let(:hikelog) { FactoryGirl.create(:hikelog, user: user, title: "Tahoe", content: "foobar") }
    before do
      sign_in user
      visit edit_hikelog_path(hikelog)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update your hikelog") }
      it { should have_selector('title', text: "Edit hikelog") }
    end

    describe "with invalid information" do
      let(:new_length) { "cat" }
      before do
        fill_in "Length of hike in miles - optional", with: new_length
        click_button "Save changes"
      end

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_title) { "Shasta" }
      let(:new_content) { "blahblah" }
      before do
        fill_in "Title",   with: new_title
        fill_in "Hikelog report", with: new_content
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_title) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { hikelog.reload.title.should  == new_title }
      specify { hikelog.reload.content.should == new_content }
    end
  end
end