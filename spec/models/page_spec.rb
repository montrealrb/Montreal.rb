require "rails_helper"

RSpec.describe Page, type: :model do
  describe "attribute validations" do
    it "validates when the body is not defined" do
      page = build :page, body: nil
      expect(page).to be_valid
    end

    it "does not validate when the title is not defined" do
      page = build :page, title: nil
      expect(page).to_not be_valid
    end

    it "does not validate when the state is not defined" do
      page = build :page, state: nil
      expect(page).to_not be_valid
    end
  end

  it "defaults to a draft state" do
    expect(Page.new.state).to eq "draft"
  end
end
