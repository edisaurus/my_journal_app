class Category < ApplicationRecord
    validates :name, :description, :date_created, presence: true
    validates :description, length: { minimum:10 }
end
