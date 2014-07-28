require 'spec_helper'

describe Micropost do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = Micropost.new(content: "Lerem ipsum", user_id: user.id)
  end

  subject { @micropost }

  # $B3F9`L\$,$"$k$3$H$r%A%'%C%/(B
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  # content$B$NFbMF$r%A%'%C%/(B
  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end
  describe " with too long content" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end
end
