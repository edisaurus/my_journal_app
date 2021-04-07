class Task < ApplicationRecord
  validates :name, :description, :start_date, :end_date, :accomplished, presence: true
  validates :description, length: { minimum:10 }
  belongs_to :category
end
