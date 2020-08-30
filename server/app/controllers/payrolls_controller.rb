class PayrollsController < ApplicationController
  def create
    file = payroll_params[:file]

    unless file.content_type == 'text/csv'
      render status: :unsupported_media_type
      return
    end

    errors = Payroll.add_data_from_csv(file)

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
