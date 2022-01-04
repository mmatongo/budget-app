class Category < ApplicationRecord
  validates :name, :icon, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_and_belongs_to_many :payments

  def total_amount
    payments.sum('amount')
  end
end
