# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobPolicy do
  let(:user) { create :user }
  let(:job) { create :job, :draft }

  subject { described_class }

  permissions :new?, :create?, :confirmation? do
    context "when record is in draft state" do
      context "when the author is the current user" do
        before { job.update!(author: user) }

        it "grants the access" do
          expect(subject).to permit(user, job)
        end
      end

      context "when the author is not the current user" do
        it "denies the access" do
          expect(subject).not_to permit(user, job)
        end
      end
    end

    context "when the record is not in draft mode" do
      before { job.update!(state: :published) }

      it "denies the access" do
        expect(subject).not_to permit(user, job)
      end
    end
  end
end
