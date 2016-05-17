require 'rails_helper'

RSpec.describe TextHelper do
  let(:markdown) { "# title\n\nbody" }
  let(:html) { "<h1>title</h1>\n\n<p>body</p>\n" }

  it "transforms md to html" do
    expect(render_markdown_as_html(markdown)).to eq html
  end

  it "can handle nil" do
    expect(render_markdown_as_html(nil)).to eq ''
  end
end
