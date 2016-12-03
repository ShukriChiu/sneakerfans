class Tech < ApplicationRecord
  belongs_to :brand
  has_many :affections
  has_many :users, through: :affections
end
