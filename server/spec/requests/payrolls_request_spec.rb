require 'rails_helper'

RSpec.describe "Payrolls", type: :request do
  describe 'POST /payrolls' do
    context 'when processing a payroll from CSV format' do
      before(:each) do
        create(:job_group, name: 'A')
        create(:job_group, name: 'B')
      end

      context 'on adding rows' do
        it 'should return respone 201' do
          create(:employee, employee_id: '1')
          create(:employee, employee_id: '2')

          post '/payrolls', params: {
            upload: {
              file: fixture_file_upload('time-report-79.csv', 'text/csv')
            }
          }

          expect(response).to have_http_status(:created)

          payrolls_for_employee_one = Payroll.where(employee_id: '1')
          expect(payrolls_for_employee_one.count).to eq(2)
        end
      end

      context 'on error' do
        it 'should return a 400 response' do
          post '/payrolls', params: {
            upload: {
              file: fixture_file_upload('time-report-79.csv', 'text/csv')
            }
          }

          expect(response).to have_http_status(:bad_request)

          json = JSON.parse(response.body)

          expect(json['data'].first).to include("errors", "date", "employee_id")
        end
      end
    end

    context 'on non-CSV files' do
      it 'should return a 415 response' do
        non_csv_file = fixture_file_upload('time-report-79.csv', 'text/plain')

        post '/payrolls', params: { upload: { file: non_csv_file } }

        expect(response).to have_http_status(:unsupported_media_type)
      end
    end
  end
end
