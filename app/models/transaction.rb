class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  
end
