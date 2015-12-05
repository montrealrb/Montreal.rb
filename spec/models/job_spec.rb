require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "validation" do
    it { should validate_presence_of(:title) }
    it do
      should validate_length_of(:title).
        is_at_most(ActiveRecordExtensions::MAX_STRING_COLUMN_LENGTH)
    end
    it { should validate_presence_of(:description) }
    it do
      should validate_length_of(:description).
        is_at_most(ActiveRecordExtensions::MAX_TEXT_COLUMN_LENGTH)
    end
    context "for state" do
      Job::STATES.each do |state|
        it "passes for value #{state}" do
          job = build(:job, state: state)
          expect(job).to be_valid
        end
      end
      it "fails for invalid value" do
        job = build(:job, state: "someinvalidvalue")
        expect(job).to_not be_valid
        expect(job.errors.messages[:state]).to be_present
      end
      it "fails for empty value" do
        job = build(:job, state: "")
        expect(job).to_not be_valid
        expect(job.errors.messages[:state]).to be_present
      end
      it "fails for not being present (nil value)" do
        job = build(:job, state: nil)
        expect(job).to_not be_valid
        expect(job.errors.messages[:state]).to be_present
      end
    end
  end
end
