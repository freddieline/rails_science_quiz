class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
