FactoryBot.define do
  factory :log do
    place   {"miyake"}
    date    {"2019-08-31"}
    point   {"okubo"}
    member  {"genta"}
    En      {"10:10"}
    Ex      {"11:11"}
    Dt      {"49"}
    Max     {"24"}
    Ave     {"12"}
    Cl      {"23"}
    Temp    {"27"}
    fish    {"manbow"}
    image   {File.open("#{Rails.root}/app/assets/images/sea.jpg")}
    user
  end
end