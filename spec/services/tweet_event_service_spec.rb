# frozen_string_literal: true

require "rails_helper"

RSpec.describe TweetEventService do
  let(:event) { create(:event) }
  let(:service) { described_class.new(event) }

  subject { service.tap(&:call) }
  before {
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).with(String)
  }

  its(:success?) { is_expected.to eq true }

  it "tweets" do
    expect_any_instance_of(Twitter::REST::Client).to receive(:update).with(String)
    subject
  end

  context "when twitter returns an error" do
    before do
      allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_raise(Twitter::Error)
    end

    its(:success?) { is_expected.to eq false }
  end
end
