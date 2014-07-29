require 'spec_helper'

describe "MicropostPages" do

  # $B%F%9%HBP>]$r5-=R(B(page, @user, etc..)
  subject { page }

  # $BA0Ds>r7o$r5-=R(B 
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  # $B%F%9%H>r7o$r5-=R(B
  # $B%^%$%/%m%]%9%HEj9F%F%9%H(B
  describe "micropost creation" do
    before { visit root_path }

    # $BITEv$J>pJs$N>l9g(B
    describe "with invalid information" do
      
      # $B:n@.$5$l$J$$(B
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      # $B%(%i!<I=<((B
      describe "error message" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    # $BE,@Z$JF~NO$N>l9g(B
    describe "with valid information" do
      
      before { fill_in 'micropost_content', with: "testtest" }
      # $B%^%$%/%m%]%9%H$,:n@.$5$l$k!J%+%&%s%H$,$"$,$k!K(B
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
