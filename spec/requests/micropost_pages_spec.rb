require 'spec_helper'

describe "MicropostPages" do

  # テスト対象を記述(page, @user, etc..)
  subject { page }

  # 前提条件を記述 
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  # テスト条件を記述
  # マイクロポスト投稿テスト
  describe "micropost creation" do
    before { visit root_path }

    # 不当な情報の場合
    describe "with invalid information" do
      
      # 作成されない
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      # エラー表示
      describe "error message" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    # 適切な入力の場合
    describe "with valid information" do
      
      before { fill_in 'micropost_content', with: "testtest" }
      # マイクロポストが作成される（カウントがあがる）
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
