require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(name: "Hermione Granger", email: 'user@example.com', badge_number: 123456789) }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "has a badge_number" do
    expect(@user.badge_number).to eq (123456789)
  end

  it "has many study_sessions" do
    @user.study_sessions.create
    expect(@user.study_sesions).to eq(1)
  end

  it "has a name" do
    expect(@user.name).to eq "Hermione Granger"
  end
end
