FactoryBot.define do
  factory :instructor_profile do
    id { 1 }
    user_id { 1 }
    sca_name { "MyString" }
    sca_title { "MyString" }
    phone_number { "MyString" }
    mundane_name { "MyString" }
    class_limit { "" }
    kingdom { "MyString" }
    phone_number_onsite { "MyString" }
    contact_via { "MyText" }
    available_days { "2018-02-07 18:22:39" }
  end
end
