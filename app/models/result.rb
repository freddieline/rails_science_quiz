class Result < ApplicationRecord
  belongs_to :quiz
  has_many :incorrect_questions, dependent: :destroy
  has_many :correct_questions, dependent: :destroy
  validates :name, presence: true
end
