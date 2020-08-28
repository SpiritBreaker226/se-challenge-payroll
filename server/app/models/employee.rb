class Employee < ApplicationRecord
  has_many :payrolls

  validates :employee_id,
    presence: { message: "Id can't be blank" },
    uniqueness: { message: "Id must be unique" }

  alias_attribute :identifier, :employee_id
end
