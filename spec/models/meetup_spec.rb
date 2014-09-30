require 'rails_helper'

RSpec.describe Meetup, :type => :model do

  describe ".next" do

    it "returns a Meetup::NotScheduledYet if there is upcomming meetups" do
      expect(Meetup.next).to be_a Meetup::NotScheduledYet
    end

  end

  describe Meetup::NotScheduledYet do

    describe "#starts_at" do

      let(:next_meetup) { described_class.new }

      context "when on the 1st Monday of the month" do

        it "returns the 3rd tuesday of the current month" do
          Timecop.freeze('2014-09-01') do
            expect(next_meetup.starts_at.iso8601).to be == '2014-09-16T20:00:00-04:00'
          end
        end

      end

      context "when on the day itself" do

        it "returns the 3rd tuesday of the current month" do
          Timecop.freeze('2014-09-16T20:00:00-04:00') do
            expect(next_meetup.starts_at.iso8601).to be == '2014-09-16T20:00:00-04:00'
          end
        end

      end

      context "when on the day after" do

        it "returns the 3rd tuesday of the next month" do
          Timecop.freeze('2014-09-17') do
            expect(next_meetup.starts_at.iso8601).to be == '2014-10-21T20:00:00-04:00'
          end
        end

      end

    end

  end

end
