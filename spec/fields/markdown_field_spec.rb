require "rails_helper"
require "administrate/field/base"

RSpec.describe MarkdownField do
  describe "#to_s" do
    let(:data) { "data" }
    subject { described_class.new(:attribute, data, :page).to_s }

    it { is_expected.to eq data }
  end
end
