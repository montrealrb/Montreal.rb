require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do
    context "page has a title" do
      it "displays the full title" do
        expect(full_title("Events")).to eq "Events | Montreal.rb"
      end
    end

    context "page does not have a title" do
      it "displays the right title" do
        expect(full_title(" ")).to eq "Montreal.rb"
      end
    end
  end
end
