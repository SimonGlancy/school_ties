require 'rails_helper'

feature 'members' do


  context 'no members have been added' do
    scenario 'should display a prompt to add a member' do
      visit '/members'
      expect(page).to have_content 'No members yet'
      expect(page).to have_link 'Add a Member'
    end
  end

  context 'member can be created' do
    scenario 'should show all members' do
      populate_universites

      create_member

      expect(page).to have_content 'Simon'
      expect(page).to have_content 'simon@email.com'
      expect(current_path).to eq '/members'
    end
  end
end
