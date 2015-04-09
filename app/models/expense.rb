class Expense < ActiveRecord::Base
  validates :invoice_id, presence: true
  validates :line_index, presence: true
  validates :expense, presence: true
end
