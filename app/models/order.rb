class Order < ApplicationRecord
  enum payment_method: { credit_card: 1, transfer: 2 }
  enum status: { not_paid: 0,  paid: 1, producting: 2, shipping: 3, shipped: 4 }
end
