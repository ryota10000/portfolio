class Score < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 10 }
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: -1000000, less_than_or_equal_to: 1000000 }
end
