FactoryGirl.define do
  factory :user do
    # instead of static data, add sequence data.
#    name     "Michael Hartl"
#    email    "michael@example.com"
#    password "foobar"
#    password_confirmation "foobar"
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :user2, class: User do
    name     "Tom White"
    email    "tom@example.com"
    password "testtest"
    password_confirmation "testtest"
  end

  factory :user3, class: User do
    name     "Ken Tanaka"
    email    "ken@example.com"
    password "testtesttest"
    password_confirmation "testtesttest"
  end
end
