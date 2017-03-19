require "rails_helper"

RSpec.describe Homework, type: :model do
  it { should validate_presence_of(:teacher) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:due_on) }

  describe "#can_be_solved?" do
    context "when the due_date is in the future" do
      before :each do
        @teacher = FactoryGirl.create(:teacher)
        @homework = FactoryGirl.create(:homework, teacher: @teacher, due_on: Time.now + 7.days)
      end

      it "should return true" do
        expect(@homework.can_be_solved?).to be_truthy
      end
    end

    context "when the due_date is in the past" do
      before :each do
        @teacher = FactoryGirl.create(:teacher)
        @homework = FactoryGirl.create(:homework, teacher: @teacher, due_on: Time.now - 7.days)
      end

      it "should return false" do
        expect(@homework.can_be_solved?).to be_falsey
      end
    end
  end
end