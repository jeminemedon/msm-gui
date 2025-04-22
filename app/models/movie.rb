class Movie < ApplicationRecord
  belongs_to :director
  has_many :characters
  has_many :actors, through: :characters
end
