class Employee < ApplicationRecord
  validates :employee_id,
    presence: { message: "Id can't be blank" },
    uniqueness: { message: "Id must be unique" }
end
