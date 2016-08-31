require 'rails_helper'

describe School, type: :model do

  it { should have_many :attendances }

  before(:each) do
    @london_grammar = School.create(name: "London Grammar")
    @london_university = School.create(name: "London University")
    @simon = Member.create(name: "Simon", email: "simon@email.com")
    @terry = Member.create(name: "Terry", email: "terry@email.com")
  end

  it "allows a school to be created" do
    expect(School.all.length).to eq(2)
  end

  it "allows a school to have attendees" do
    @simon.attendances.create(school: @london_grammar)
    @terry.attendances.create(school: @london_grammar)
    expect(@london_grammar.members.length).to equal(2)
  end

  it "does not allow duplicate schools" do
    School.create(name: "London Grammar")
    expect(School.all.length).to eq(2)
  end
end
