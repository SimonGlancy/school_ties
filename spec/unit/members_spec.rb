require 'rails_helper'

describe Member, type: :model do

  it "allows a member to be created" do
    Member.create(name: "Simon", email: "simon@email.com")
    expect(Member.all.length).to eq(1)
  end
end
