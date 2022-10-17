class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
  validates :user_id, presence: true
end
