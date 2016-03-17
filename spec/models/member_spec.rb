require "rails_helper"

RSpec.describe Member, type: :model do
  context "without a name" do
    it "should be invalid" do
      member = Member.new

      member.email = "gala@example.com"

      expect(member).to be_invalid
    end
  end

  context "without an email" do
    it "should be invalid" do
      member = Member.new

      member.name = "Zaba"

      expect(member).to be_invalid
    end
  end

  context "with a duplicate email" do
    it "should be invalid" do
      member1 = Member.new
      member1.name = "Zaba"
      member1.email = "gala@example.com"

      member2 = Member.new
      member2.name = "Gala"
      member2.email = "gala@example.com"

      member1.save

      expect(member2).to be_invalid
    end
  end
end
