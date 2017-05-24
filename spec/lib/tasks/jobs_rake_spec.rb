# frozen_string_literal: true
require "rails_helper"

describe "jobs:populate_job_field" do
  include_context "rake"

  let(:invoke) do
    subject.invoke
    jobs.each(&:reload)
  end

  context "when the jobs are published" do
    context "when there's no published_at date" do
      let!(:jobs) { create_list(:job, 3, :published_without_published_at) }

      it "populate the published_at date" do
        invoke

        expect(jobs.map(&:published_at)).to all be_present
      end
    end

    context "when there's a published_at date" do
      let!(:jobs) { create_list(:job, 3, :published) }
      let!(:jobs_current_date_time) { jobs.map(&:published_at) }

      it "doesn't change the published_at date" do
        invoke

        expect(jobs.map(&:published_at)).to eq jobs_current_date_time
      end
    end
  end

  context "When the jobs aren't published" do
    let!(:jobs) { create_list(:job, 3, :draft) }

    it "doesn't populate the published_at date" do
      invoke

      expect(jobs.map(&:published_at)).to all be_blank
    end
  end
end
