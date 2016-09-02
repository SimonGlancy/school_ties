
require 'rails_helper'

feature 'schools' do
  context 'no schools have been added' do
    scenario 'should display a prompt to add a school' do
      visit '/schools'
      expect(page).to have_content 'No schools yet'
      expect(page).to have_link 'ADD A SCHOOL'
    end
  end

  context 'school can be created' do
    scenario 'should show all schools' do
      visit '/schools'
      expect(page).to have_content 'No schools yet'
      expect(page).to have_link 'ADD A SCHOOL'
      click_link 'ADD A SCHOOL'
      fill_in 'Name', with: 'London Grammar'
      click_button 'Create School'
      expect(page).to have_content 'London Grammar'
      expect(current_path).to eq '/schools'
    end
  end

  context 'viewing schools' do

    let!(:ldng){ School.create(name:'London Grammar') }

    scenario 'lets a user view a school with no attendees message' do
     visit '/schools'
     click_link 'London Grammar'
     expect(page).to have_content 'London Grammar'
     expect(page).to have_content 'No Attendees yet'
     expect(current_path).to eq "/schools/#{ldng.id}"
    end

    scenario 'lets a user view a school with attendees' do
     simon = Member.create(name:"Simon", email: "simon@email.com")
     simon.attendances.create(school: ldng)
     visit '/schools'
     click_link 'London Grammar'
     expect(page).to have_content 'London Grammar'
     expect(page).to have_content simon.name
     expect(page).to have_content simon.email
     expect(current_path).to eq "/schools/#{ldng.id}"
    end
  end
end
