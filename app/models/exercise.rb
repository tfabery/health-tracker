class Exercise < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :calories
end
