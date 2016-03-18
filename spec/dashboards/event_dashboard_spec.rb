require "rails_helper"

RSpec.describe EventDashboard do
  describe "#display_resource" do
    let(:event) { create :event }

    it "returns the event's title" do
      expect(subject.display_resource(event)).to eq event.title
    end
  end
end
