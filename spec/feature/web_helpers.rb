def create_member(name: 'Simon',
                  email: 'simon@email.com',
                  primary_school: 'London Primary',
                  secondary_school: 'London Grammar',
                  university: 'London University')
visit '/members'
expect(page).to have_content 'No members yet'
expect(page).to have_link 'Add a Member'
click_link 'Add a Member'
fill_in 'Name', with: name
fill_in 'Email', with: email
select primary_school, from: "attendances_school_id1"
select secondary_school, from: "attendances_school_id2"
select university, from: "attendances_school_id3"
click_button 'Create Member'

end

def populate_universites
  School.create(name: "London Primary")
  School.create(name: "London Grammar")
  School.create(name: "London University")
end
