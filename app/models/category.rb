class Category < ApplicationRecord
    validates :name, :description, :date_created, presence: true
    validates :description, length: { minimum:10 }
    has_many :tasks, dependent: :destroy
end
