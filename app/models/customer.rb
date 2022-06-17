class Customer < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/},length: {in: 2..50}
    validates :age, presence: true, numericality: {in: 8..99}
    validates :gender, presence: true
end
