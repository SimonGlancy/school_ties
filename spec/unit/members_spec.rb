require 'rails_helper'

describe Member, type: :model do

  it { should have_many :attendances }

  before(:each) do
    @london_grammar = School.create(name: "London Grammar")
    @london_university = School.create(name: "London University")
    @simon = Member.create(name: "Simon", email: "simon@email.com")
  end


  it "allows a member to be created" do
    expect(Member.all.length).to eq(1)
  end

  it "does not allow a member to be created with blank attributes" do
    Member.create(name: "", email: "")
    expect(Member.all.length).to eq (1)
  end

  it "does not allow a user to sign up with the same email as someone" do
    Member.create(name: "Simon", email: "simon@email.com")
    expect(Member.all.length).to eq(1)

  end

  it "allows a member to have multiple schools" do
    @simon.attendances.create(school: @london_grammar)
    @simon.attendances.create(school: @london_university)

    expect(@simon.schools.length).to eq(2)
    expect(@london_grammar.members.length).to eq(1)
    expect(@london_university.members.length).to eq(1)
  end

  it "does not allow repeats in the attendances table" do
    @simon.attendances.create(school: @london_grammar)
    @simon.attendances.create(school: @london_university)
    @simon.attendances.create(school: @london_university)

    expect(@simon.schools.length).to eq(2)
  end

  it "doesn't allow a user to be created if email format is wrong" do
    simon = Member.new(name: "Simon", email:"simon")
    expect(simon.save).to be false
  end



end
