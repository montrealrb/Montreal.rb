require "rails_helper"

RSpec.describe JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jobs").to route_to("jobs#index")
    end

    it "routes to #show" do
      expect(get: "/jobs/1").to route_to("jobs#show", id: "1")
    end
  end
end
