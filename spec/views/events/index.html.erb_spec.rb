# frozen_string_literal: true

require "rails_helper"

describe "events/index.html.erb" do
  let!(:future_event) { create :event, :scheduled, starts_at: 1.month.from_now }
  let!(:past_event)   { create :event, :scheduled, starts_at: 1.month.ago }

  before do
    assign :future_events, [future_event]
    assign :past_events, [past_event]
  end

  it "displays all the events" do
    render
    expect(rendered).to include future_event.title
    expect(rendered).to include past_event.title
  end

  it "links events title to corresponding show page" do
    render
    expect(rendered).to have_link future_event.title, href: event_path(future_event)
  end

  context "there are no future events" do
    before { assign :future_events, [] }

    it "does not display anything about upcoming events" do
      render
      expect(rendered).not_to have_css "h2", text: "Upcoming Event"
    end
  end

  context "event has a talk" do
    let(:member) { create :member }
    let!(:talk)  { create :talk, state: "scheduled", event: past_event, member: member }

    it "displays the talks header" do
      render
      expect(rendered).to have_css "h3", text: "Talks"
      expect(rendered).to have_css "p", text: "#{talk.title.titleize}, by #{member.name}"
    end
  end

  context "event has no talks" do
    it "does not show anything about talks" do
      render
      expect(rendered).not_to have_css "h3", text: "Talks"
      expect(rendered).not_to have_css "h4"
    end
  end
end
