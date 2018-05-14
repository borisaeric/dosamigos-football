class Season < ApplicationRecord
  has_and_belongs_to_many :clubs
  has_many :matches, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, uniqueness: true
end
