class Season < ApplicationRecord
  has_and_belongs_to_many :clubs
  has_many :matches, dependent: :destroy
end
