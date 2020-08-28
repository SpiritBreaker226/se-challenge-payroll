FactoryBot.define do
  factory :payroll do
    employee { create :employee }
    job_group { create :job_group }
    payroll_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    hours { Faker::Number.within(range: 1..24) }
    payroll_id { Faker::Number.within(range: 0..10) }
  end
end
