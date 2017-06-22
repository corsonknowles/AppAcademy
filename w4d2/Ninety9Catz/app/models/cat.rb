class Cat < ApplicationRecord
  COLORS = %w(orange tabby black)
  validates :birth_date, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }, presence: true

  def age
    Time.now.to_date.year - birth_date.year
  end

  has_many :cat_rentals, dependent: :destroy
end
