FactoryBot.define do
  factory :employee do
    employee_id { Faker::IDNumber.brazilian_citizen_number }
  end
end
