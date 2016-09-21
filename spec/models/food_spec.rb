require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should belong_to :user }
end
