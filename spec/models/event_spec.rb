# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  let(:event) { create(:event) }
  let(:member) { create(:member) }
  let(:talks) { create_list(:talk, 5, event: event) }
  let(:tweet_service) { double(:service, call: true) }

  before do
    allow(TweetEventService).to receive(:new) { tweet_service }
  end

  it_behaves_like "an author"

  describe "attributes" do
    it do
      is_expected.
        to respond_to :starts_at, :location, :title, :body, :state
    end

    it { is_expected.to have_many :talks          }
    it { is_expected.to belong_to :location       }
    it { is_expected.to have_many :sponsorships }
    it do
      is_expected.to have_many(:sponsors).
        through(:sponsorships).
        source(:organization)
    end

    it "includes only scheduled talks" do
      expect(event.talks).to match(talks.select { |t| t.state == "scheduled" })
      expect(event.talks).to_not match(talks.select { |t| t.state == "proposed" })
    end
  end

  describe "attribute validations" do
    it { is_expected.to validate_presence_of :starts_at }
    it { is_expected.to validate_presence_of :location  }
    it { is_expected.to validate_presence_of :title     }
    it { is_expected.to validate_presence_of :state     }

    it { is_expected.to validate_inclusion_of(:state).in_array Event::STATES }
  end

  context "when an event is authored" do
    it "does not validate when 'body' is blank" do
      event = Event.new(title: nil)
      expect(event).to be_invalid
      expect(event.errors.messages.keys).to include :body
    end
  end

  describe "#to_s" do
    let(:event) { create(:event, starts_at: "2016/03/01") }
    subject { event.to_s }

    it { is_expected.to eq "#{event.title} : March 01" }
  end

  describe "#tweet" do
    context "the event is scheduled" do
      let(:event) { create(:event, state: "scheduled") }

      it "calls the callback" do
        expect(tweet_service).to receive(:call)
        event.tweet
      end
    end

    context "the event is scheduled" do
      let(:event) { create(:event, state: "proposed") }

      it "does not calls the callback" do
        expect(tweet_service).to_not receive(:call)
        event.tweet
      end
    end

    context "the event is not persisted" do
      let(:event) { build(:event, state: "scheduled") }

      it "does not calls the callback" do
        expect(tweet_service).to_not receive(:call)
        event.tweet
      end
    end
  end

  describe "delete" do
    it "unlink all related talks" do
      count = 0
      5.times do
        count += 1
        Talk.create(member: member,
                    event: event,
                    title: "Title Number #{count})",
                    state: "scheduled")
      end
      expect(event.talks.count).to eq 5
      event.unlink_all_talks
      expect(Talk.where(event_id: event.id).count).to eq 0
    end
  end
end
