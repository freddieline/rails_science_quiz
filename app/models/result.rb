class Result < ApplicationRecord
  belongs_to :quiz
  validates :name, presence: true
end
