# == Schema Information
#
# Table name: talks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  bio         :text
#  slides      :string(255)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Talk, :type => :model do

# As a member, I want to be able to register my proposed talk with
# french + english
# title
# Description
# Link to my presenation slides (slideshare or html)

  let(:user) { build(:user) }
  let(:talk) { build(:talk, bio: "", author: user) }

  it "should be valid" do
    expect(talk.valid?).to eq(true)
  end
end
