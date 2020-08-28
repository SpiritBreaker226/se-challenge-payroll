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

  def self.add_data_from_csv(file)
    payroll_id = Payroll.get_payroll_id_from_filename(file)

    CSV.foreach(file.path, headers: :first_row) do |row|
      employee = Employee.find_by_employee_id(row['employee id'])
      job_group = JobGroup.find_by_name(row['job group'])

      Payroll.create!(
        employee: employee,
        job_group: job_group,
        payroll_date: row['date'],
        hours: row['hours worked'],
        payroll_id: payroll_id
      )
    end
  end

  private

  def self.get_payroll_id_from_filename(file)
    File.basename(file.original_filename, ".*").split('-').last.to_i
  end
end
