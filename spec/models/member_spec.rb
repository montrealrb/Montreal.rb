require 'rails_helper'

RSpec.describe Member, type: :model do
  context "without a name" do
    it "should not create a member" do
      member = Member.new

      member.email = 'gala@example.com'
      member.save

      expect(member.valid?).to be false
    end
  end

  context "without an email" do
    it "should not create a member" do
      member = Member.new

      member.name = 'Zaba'
      member.save

      expect(member.valid?).to be false
    end
  end

  context "with a duplicate email" do
    it "should not create a member" do
      member1 = Member.new
      member1.name = 'Zaba'
      member1.email = 'gala@example.com'

      member2 = Member.new
      member2.name = 'Gala'
      member2.email = 'gala@example.com'

      member1.save
      member2.save

      expect(member2.valid?).to be false
    end
  end
end
