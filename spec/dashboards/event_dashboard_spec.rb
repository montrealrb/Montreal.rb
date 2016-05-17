require "rails_helper"

RSpec.describe EventDashboard do
  describe "#display_resource" do
    let(:event) { create :event }

    it "returns the event's title" do
      expect(subject.display_resource(event)).to include event.title
      expect(subject.display_resource(event)).to include event.starts_at.strftime('%B %e, %Y')
    end
  end
end
