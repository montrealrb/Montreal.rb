# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::RegistrationsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "#create" do
    let(:attributes) { { email: "stranger@things.com", password: "superseekret" } }
    let(:service) { double(:service, call: true) }

    before do
      allow(SlackInvitationSendingService).to receive(:new).and_return service
    end

    it "sends the slack invitation" do
      post :create, params: { user: attributes }
      expect(service).to have_received(:call)
    end
  end
end
