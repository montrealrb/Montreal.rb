# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  starts_at  :datetime         not null
#  created_at :datetime
#  updated_at :datetime
#

require "rails_helper"

RSpec.describe Event, type: :model do
  describe "attribute validations" do
    it "does not validate when 'starts_at' is not defined" do
      event = Event.new(starts_at: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :starts_at
    end

    it "does not validate when 'location_id' is not defined" do
      event = Event.new(location_id: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :location
    end

    it "does not validate when 'title' is not defined" do
      event = Event.new(title: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :title
    end

    it "does not validate when 'author' is not defined" do
      event = Event.new(author: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :author
    end
  end

  context "when an event is authored" do
    it "knows about its author" do
      author = create(:user)
      event = create(:event, author: author)
      expect(event.author).to eq author
    end
  end
end
