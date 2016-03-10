require "rails_helper"

RSpec.describe Event, type: :model do
  let(:event) { FactoryGirl.create(:event) }
  let(:talks) { FactoryGirl.create_list(:talk, 5, event: event) }

  describe "attributes" do
    it do
      is_expected.
        to respond_to :starts_at, :location, :title, :author, :introduction, :conclusion, :state
    end

    it { is_expected.to have_many :talks    }
    it { is_expected.to belong_to :location }
    it { is_expected.to belong_to :author   }

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
  end
end
