require "rails_helper"

describe "events/index.html.erb" do
  it "displays all the events" do
    first_event = create(:event)
    second_event = create(:event, title: "event two")
    assign(:events, [first_event, second_event])
    render

    expect(rendered).to match(/#{first_event.title}/)
    expect(rendered).to match(/#{second_event.title}/)
  end

  it "links events title to corresponding show page" do
    event = create(:event)
    assign(:events, [event])
    render

    expect(rendered).to have_link "#{event.title}", href: event_path(event)
  end
end
