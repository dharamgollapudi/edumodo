require "rails_helper"

RSpec.describe Solution, type: :model do
  it { should validate_presence_of(:student) }
  it { should validate_presence_of(:homework) }
  it { should validate_presence_of(:answer) }

end