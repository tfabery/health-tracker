require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :foods }
  it { should have_many :exercises }
end
