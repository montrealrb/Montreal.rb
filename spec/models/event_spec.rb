require "rails_helper"

RSpec.describe Event, type: :model do
  let(:event) { FactoryGirl.create(:event) }
  let(:talks) { FactoryGirl.create_list(:talk, 5, event: event) }
  let(:tweet_service) { double(:service, call: true ) }

  before do
    allow(TweetEventService).to receive(:new) { tweet_service }
  end

  describe "attributes" do
    it do
      is_expected.
        to respond_to :starts_at, :location, :title, :author, :body, :state
    end

    it { is_expected.to have_many :talks          }
    it { is_expected.to belong_to :location       }
    it { is_expected.to belong_to :author         }
    it { is_expected.to have_many :sponsorships }
    it do
      is_expected.to have_many(:sponsors).
        through(:sponsorships).
        source(:organization)
    end

    it "includes only scheduled talks" do
      expect(event.talks).to     match talks.select { |t| t.state == "scheduled" }
      expect(event.talks).to_not match talks.select { |t| t.state == "proposed"  }
    end
  end

  describe "attribute validations" do
    it { is_expected.to validate_presence_of :starts_at }
    it { is_expected.to validate_presence_of :location  }
    it { is_expected.to validate_presence_of :title     }
    it { is_expected.to validate_presence_of :author    }
    it { is_expected.to validate_presence_of :state     }

    it { is_expected.to validate_inclusion_of(:state).in_array Event::STATES }
  end

  context "when an event is authored" do
    it "knows about its author" do
      author = create(:user)
      event = create(:event, author: author)
      expect(event.author).to eq author
    end

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

  describe "#tweet_event" do
    let(:event) { create(:event, state: "proposed") }

    it "calls the callback" do
      expect(tweet_service).to receive(:call)
      event.update_attributes(state: "scheduled")
    end

    it "does not calls the callback" do
      expect(tweet_service).to_not receive(:call)
      event.update_attributes(title: "something")
    end
  end
end
