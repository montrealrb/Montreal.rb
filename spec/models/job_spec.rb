require "rails_helper"

RSpec.describe Job, type: :model do
  describe "attribute validations" do
    it "does not validate when 'published_by' is not defined" do
      job = Job.new(published_by: nil)
      expect(job).to be_invalid
      expect(job.errors.messages.keys).to include :published_by
    end
  end

  context "when a job is published" do
    it "knows about its publisher" do
      publisher = create(:user)
      job = create(:job, published_by: publisher)
      expect(job.published_by).to eq publisher
    end
  end
end
