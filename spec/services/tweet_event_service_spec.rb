require "rails_helper"

RSpec.describe TweetEventService do
  let(:event) { create(:event) }
  let(:message) { "Testing the twitter feature for montrealrb.com" }
  let(:service) { described_class.new(event) }

  subject { service.tap(&:call) }

  before { allow(service).to receive(:message) { message } }

  its(:success?) { is_expected.to eq true }

  it "tweets" do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).with(message)
    subject
  end
end
