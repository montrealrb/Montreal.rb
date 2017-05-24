# frozen_string_literal: true
shared_examples "an author" do
  let(:author) { build(:user) }
  subject { build(described_class.name.underscore, author: author) }

  describe "#attributes" do
    it { is_expected.to respond_to(:author) }
  end

  context "without an author" do
    before do
      subject.author = nil
    end
    it { is_expected.to belong_to :author }

    it "should be invalid" do
      expect(subject).to be_invalid
    end

    it "sets an error" do
      subject.validate

      expect(subject.errors.messages.keys).to include :author
    end
  end

  context "whith an author" do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "should return the author" do
      expect(subject.author).to eq author
    end
  end
end
