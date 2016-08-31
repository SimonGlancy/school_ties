require 'rails_helper'

describe School, type: :model do

  it "allows a school to be created" do
    School.create(name: "London Grammar")
    expect(School.all.length).to eq(1)
  end
end
