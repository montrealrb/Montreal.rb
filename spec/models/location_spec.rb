# frozen_string_literal: true

require "rails_helper"

RSpec.describe Location, type: :model do
  it { should have_many(:events) }

  describe "attribute validations" do
    it "does not validate when name is not defined" do
      location = Location.new(name: nil)
      expect(location).to be_invalid
      expect(location.errors.messages.keys).to include :name
    end
  end
end
