require "rails_helper"

RSpec.describe Assignment, type: :model do
  it { should validate_presence_of(:homework) }
  it { should validate_presence_of(:student) }

end