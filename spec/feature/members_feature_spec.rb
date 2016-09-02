require 'rails_helper'

feature 'members' do


  context 'no members have been added' do
    scenario 'should display a prompt to add a member' do
      visit '/members'
      expect(page).to have_content 'No members yet'
      expect(page).to have_link 'ADD A MEMBER'
    end
  end

  context 'member can be created' do
    scenario 'member can be added and navigate to profile' do
      populate_universites

      create_member

      expect(page).to have_content 'Simon'
      expect(current_path).to eq '/members'

      click_link 'Simon'

      expect(page).to have_content 'Simon'
      expect(page).to have_content 'London Primary'
      expect(page).to have_content 'London Grammar'
      expect(page).to have_content 'London University'

    end
  end

end
