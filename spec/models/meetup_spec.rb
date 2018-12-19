# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Meetup, type: :model do
  describe ".next" do
    it "returns a Meetup::NotScheduledYet if there is upcomming meetups" do
      expect(Event::Meetup.next).to be_a Event::Meetup::NotScheduledYet
    end
  end

  describe Event::Meetup::NotScheduledYet do
    describe "#starts_at" do
      let(:next_meetup) { described_class.new }

      context "when on the 1st Monday of the month" do
        it "returns the 3rd tuesday of the current month" do
          Timecop.freeze(Time.zone.local(2014, 9, 1, 0, 0, 0)) do
            expect(next_meetup.starts_at.asctime).to be == "Tue Sep 16 20:00:00 2014"
          end
        end
      end

      context "when on the day itself" do
        it "returns the 3rd tuesday of the current month" do
          Timecop.freeze(Time.zone.local(2014, 9, 16, 20, 0, 0)) do
            expect(next_meetup.starts_at.asctime).to be == "Tue Sep 16 20:00:00 2014"
          end
        end
      end

      context "when on the day after" do
        it "returns the 3rd tuesday of the next month" do
          Timecop.freeze(Time.zone.local(2014, 9, 17, 0, 0, 0)) do
            expect(next_meetup.starts_at.asctime).to be == "Tue Oct 21 20:00:00 2014"
          end
        end
      end
    end
  end
end
