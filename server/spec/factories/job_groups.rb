FactoryBot.define do
  factory :job_group do
    name { Faker::Job.seniority }
    hour_rate { Faker::Number.decimal(l_digits: 2) }
  end
end
