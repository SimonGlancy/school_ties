
require 'rails_helper'

feature 'schools' do
  context 'no schools have been added' do
    scenario 'should display a prompt to add a school' do
      visit '/schools'
      expect(page).to have_content 'No schools yet'
      expect(page).to have_link 'Add a school'
    end
  end
end
