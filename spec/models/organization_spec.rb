# frozen_string_literal: true

require "rails_helper"

RSpec.describe Organization, type: :model do
  describe "attributes" do
    it { is_expected.to have_many :sponsorships }
  end

  describe "validation" do
    subject { FactoryGirl.create(:organization) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
