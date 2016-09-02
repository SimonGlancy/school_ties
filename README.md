# School Ties

#### Problem

The database stores information on its members. Each member can be associated with 1 or more school.

Build a demo that allows someone to:

1). Add a new member with the fields “Name”, “Email Address” and "School" (selected from a list).
2). It should display all members for a selected school.


#### Technologies used

Ruby on Rails
Postgresql
Rspec and Capybara for testing

#### Install

Clone this repo and use the following commands:

* `cd school_ties`

*  `bundle`

* `rake db:create`

* `rake db:migrate`

* `rake db:migrate RAILS_ENV=test`

* `rake db:seed`

Run tests with

* `rspec`

Launch

* `rails s`

* visit http://localhost:3000/

* new members can be added at http://localhost:3000/members/new

#### Discussion

The app has a database structure of a member table linked to a school table through an attended join table in a many to many relationship.

The user has the ability to add a new school (the app has a number of seeded schools) and new member with the following inputs (Name, Email, Primary School, Secondary School, University). The problem stated that a member could be linked to multiple schools so I thought this would be the neatest way to produce that functionality.

As this is an MVP I have not included edit or delete routes in the app as they were not included in the problem.

#### Improvements

I would like to update the schools table to give them a type so that the drop downs could only include the schools that relate to the relevant section. The attendances table can be updated so that the user can input the duration of time they attended each school.

All in all, an excellent challenge and I am happy with my solution. 
