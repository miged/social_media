class Tweet < ApplicationRecord
  validates :body_text, presence: true
  belongs_to :user
end
