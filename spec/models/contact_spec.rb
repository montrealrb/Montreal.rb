# frozen_string_literal: true
require "rails_helper"

RSpec.describe Contact, type: :model do
  it { is_expected.to belong_to :organization }
  it { is_expected.to belong_to :author }

  context "without a name" do
    subject { build(:contact, name: nil) }

    it "should be invalid" do
      expect(subject).to be_invalid
    end
  end

  context "without an email" do
    subject { build(:contact, email: nil) }

    it "should be invalid" do
      expect(subject).to be_invalid
    end
  end

  context "without an author" do
    subject { build(:contact, author: nil) }

    it "should be invalid" do
      expect(subject).to be_invalid
    end
  end

  context "with a duplicate email" do
    subject { build(:contact, email: "email@example.com") }

    before do
      create(:contact, email: "email@example.com")
    end

    it "should be invalid" do
      expect(subject).to be_invalid
    end
  end
end
