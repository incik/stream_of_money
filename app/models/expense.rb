class Expense < ActiveRecord::Base
  validates :invoice_id, presence: true
  validates :description, presence: true
  validates :expense, presence: true
end
