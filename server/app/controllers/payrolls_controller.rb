class PayrollsController < ApplicationController
  def create
    errors = Payroll.add_data_from_csv(payroll_params[:file])

    if errors.count == 0
      render status: :created
    else
      render status: :bad_request, json: { data: errors }
    end
  end

  private

  def payroll_params
    params.require(:upload).permit(:file)
  end
end
