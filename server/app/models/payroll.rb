class Payroll < ApplicationRecord
  belongs_to :employee
  belongs_to :job_group

  validates :payroll_date, :hours, presence: true

  validates :hours,
    numericality: { greater_than: 0, less_than: 25 },
    unless: Proc.new { |payroll| payroll.hours.blank? }

  validates :payroll_id,
    numericality: {
      greater_than: 0, message: "Id is not a number",
      unless: Proc.new { |payroll| payroll.payroll_id.blank? }
    },
    presence: { message: "Id can't be blank" }

  alias_attribute :identifier, :payroll_id
  alias_attribute :date, :payroll_date
end
