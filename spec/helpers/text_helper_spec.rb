require "rails_helper"

RSpec.describe TextHelper do
  include ERB::Util

  let(:markdown) { "# title\n\nbody" }
  let(:html) { "<h1>title</h1>\n\n<p>body</p>\n" }

  let(:emoji_text) { "# :See No Evil:\n\n:see_no_evil:" }
  emoji_path = "<img alt=\"see_no_evil\" src=\"/images/emoji/unicode/1f648.png\" class=\"emoji\" />"
  let (:emoji_html) { "<h1>#{emoji_path}</h1>\n\n<p>#{emoji_path}</p>\n"}

  it "transforms md to html" do
    expect(render_markdown_as_html(markdown)).to eq html
  end

  it "can handle nil" do
    expect(render_markdown_as_html(nil)).to eq ""
  end

  it "can handle emojis" do
    expect(render_markdown_as_html(emoji_text)).to eq emoji_html
  end
end
