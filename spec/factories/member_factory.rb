FactoryGirl.define do
  factory :member do
    email 'bob@bob.com'
    password '12345678'


    factory :member_with_school do
      after(:create) do |user|
        create(:delivery, user: user)
      end
    end
  end
end
