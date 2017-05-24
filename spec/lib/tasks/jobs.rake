# frozen_string_literal: true
require "rails_helper"

describe "jobs:populate_job_field" do
  include_context "rake"

  context "when the jobs are published" do
    context "when there's no published_at date" do
      let!(:jobs) { create_list(:job, 3, :published) }

      before do
        subject.invoke
      end

      it "populate the published_at date" do
        expect(
          jobs.all? { |job| job.published_at.present? }
        ).to be_truthy
      end
    end

    context "when there's a published_at date" do
      let!(:current_date_time) { DateTime.current }
      let!(:jobs) { create_list(:job, 3, :published, published_at: current_date_time) }

      it "doesn't change the published_at date" do
        expect(
          jobs.all? { |job| job.published_at.to_i == current_date_time.to_i }
        ).to be_truthy
      end
    end
  end

  context "When the jobs aren't published" do
    let!(:jobs) { create_list(:job, 3, :draft) }

    before do
      subject.invoke
    end

    it "doesn't populate the published_at date" do
      expect(
        jobs.all? { |job| job.published_at.blank? }
      ).to be_truthy
    end
  end
end
