require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('First App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('|Home') }

    # it " should have the content 'First app'" do
    #   expect(page).to have_content('First App')
    # end
    # it " should have the title 'Home'" do
    #   expect(page).to have_title('Home')
    # end

    # $B%G!<%?$rMQ0U$7$F!"%5%$%s%$%s8e$NI=<(%F%9%H(B
    describe "for signed-in users" do
      # prepare user
      let (:user) { FactoryGirl.create(:user) }
      # create posts
      # sign in
      # go to page
      before do
        FactoryGirl.create(:micropost, user: user, content: "aaaaaa")
        FactoryGirl.create(:micropost, user: user, content: "bbbbbb")
        sign_in user
        visit root_path
      end

      # $BI=<(%A%'%C%/(B
      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
    it " should have the title 'Help'" do
      visit help_path
      expect(page).to have_title('Help')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end
    it " should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title('About Us')
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end

#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
end
