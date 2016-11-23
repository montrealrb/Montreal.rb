# frozen_string_literal: true
require "rails_helper"

RSpec.describe Sponsorship, type: :model do
  describe "attributes" do
    it { is_expected.to belong_to :event }
    it { is_expected.to belong_to :organization }
  end

  describe "attribute validations" do
    it { is_expected.to validate_presence_of :event }
    it { is_expected.to validate_presence_of :organization }
  end
end
