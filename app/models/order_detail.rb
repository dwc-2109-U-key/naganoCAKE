class OrderDetail < ApplicationRecord
  belongs_to :item
  enum production_status: { not_startable: 0, not_producting: 1, producting: 2, producted: 3 }
end
