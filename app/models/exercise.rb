class Exercise < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :calories
  before_save :titleize_name
private
  def titleize_name
    self.name=(name().titleize())
  end
end
