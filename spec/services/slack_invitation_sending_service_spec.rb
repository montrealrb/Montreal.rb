# frozen_string_literal: true
require "rails_helper"

RSpec.describe SlackInvitationSendingService do
  let(:user) { build :user, email: "courrier+new@sophiedeziel.com" }

  subject { described_class.new(user) }

  describe "#call" do
    it "is success", vcr: { match_requests_on: [:method, VCR.request_matchers.uri_without_param(:token)] } do
      expect(subject.call).to be_success
    end

    it "logs it", vcr: { match_requests_on: [:method, VCR.request_matchers.uri_without_param(:token)] } do
      expect(Rails.logger).to receive(:info)
      subject.call
    end

    context "when there is an error" do
      subject { described_class.new(user, "sadfasdfsdf") }

      it "is not success", record: true do
        expect(subject.call).to_not be_success
      end

      it "logs it", record: true do
        expect(Rails.logger).to receive(:info).twice
        subject.call
      end
    end
  end
end
