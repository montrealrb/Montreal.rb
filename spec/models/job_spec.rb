# frozen_string_literal: true
require "rails_helper"

RSpec.describe Job, type: :model do
  it_behaves_like "an author"

  describe "validation" do
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


  describe ".search" do
    let(:matching_title_job) { create(:job, :published, title: "Fullstack developer") }
    let(:matching_description_job) { create(:job, :published, description: "If you're a fullstack developer, this job is for you!") }
    let(:not_matching_job) { create(:job, :published, title: "RoR developer", description: "Familiarity with agile methodologies, especially Scrum or Kanban") }
    subject { described_class.search("fullstack") }

    it { is_expected.to include matching_title_job }
    it { is_expected.to include matching_description_job }
    it { is_expected.not_to include not_matching_job }
  end
  
  describe "#before_save" do
    subject { create(:job, :draft) }

    describe "#set_published_at" do
      context "when the state changed to publish" do
        it "sets the published_at date" do
          expect do
            subject.update(state: :published)
          end.to change(subject, :published_at).from(nil)
        end
      end

      context "when the state change to archived" do
        it "doesn't change the publised_at date" do
          expect do
            subject.update(state: :archived)
          end.not_to change(subject, :published_at)
        end
      end
    end
  end
end
