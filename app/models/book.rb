class Book < ApplicationRecord
	validates :title, presence: true
	validates :author, presence: true
	validates :isbn, presence: true, length: { is: 10 }, numericality: { only_integer: true }, uniqueness: true
	validates :copies, presence: true, numericality: { only_integer: true }
	has_many :reviews
end
