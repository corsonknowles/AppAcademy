class CatRental < ApplicationRecord

  STATUSES = %w( PENDING APPROVED DENIED )

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES,
    message: "%{value} is not a valid status, try PENDING APPROVED OR DENIED" }

  belongs_to :cat
  
end
