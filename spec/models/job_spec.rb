require "rails_helper"

RSpec.describe Job, type: :model do
  describe "attribute validations" do
    it { is_expected.to validate_presence_of(:title) }
    it do
      is_expected.to validate_length_of(:title).
        is_at_most(ActiveRecordExtensions::MAX_STRING_COLUMN_LENGTH)
    end
    it { is_expected.to validate_presence_of(:description) }
    it do
      is_expected.to validate_length_of(:description).
        is_at_most(ActiveRecordExtensions::MAX_TEXT_COLUMN_LENGTH)
    end
    it "does not validate when 'author' is not defined" do
      job = Job.new(author: nil)
      expect(job).to be_invalid
      expect(job.errors.messages.keys).to include :author
    end
    context "when a job is authored" do
      it "knows about its author" do
        author = create(:user)
        job = create(:job, author: author)
        expect(job.author).to eq author
      end
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
