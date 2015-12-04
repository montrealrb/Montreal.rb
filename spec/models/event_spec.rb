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

RSpec.describe Event, :type => :model do

  describe "attribute validations" do
    it "does not validate when 'starts_at' is not defined" do
      event = Event.new(starts_at: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :starts_at
    end

    it "does not validate when 'title' is not defined" do
      event = Event.new(title: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :title
    end
  end
end
