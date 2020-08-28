require 'rails_helper'

RSpec.describe Payroll, type: :model do
  let (:file) { fixture_file_upload('time-report-79.csv') }

  describe '#add_data_from_csv' do
    context 'when processing a payroll from CSV format' do
      before(:each) do
        create(:employee, employee_id: '2')
        create(:job_group, name: 'A')
        create(:job_group, name: 'B')
      end

      context 'on adding rows' do
        it 'returns nothing' do
          create(:employee, employee_id: '1')

          Payroll.add_data_from_csv(file)

          first_payroll = Payroll.first

          expect(Payroll.count).to eq(9)
          expect(first_payroll.identifier).to eq(79)
          expect(first_payroll.hours).to eq(7.5)
          expect(first_payroll.date.to_s).to eq('2016-11-14')
          expect(first_payroll.employee.identifier).to eq('1')
          expect(first_payroll.job_group.name).to eq('A')
        end
      end
    end
  end
end
