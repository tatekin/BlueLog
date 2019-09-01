FactoryBot.define do

  factory :user do
    name                  {"manbow"}
    avatar                {File.open("#{Rails.root}/app/assets/images/sea.jpg")}
    password              {"manbow"}
    password_confirmation {"manbow"}
    sequence(:email)  {Faker::Internet.email}
  end

end