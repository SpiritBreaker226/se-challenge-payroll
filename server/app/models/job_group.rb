class JobGroup < ApplicationRecord
  validates :name, :hour_rate, presence: true

  validates :name, uniqueness: true
  validates :hour_rate,
    numericality: { greater_than: 0, less_than: 99999999 },
    unless: Proc.new { |job_group| job_group.hour_rate.blank? }
end
