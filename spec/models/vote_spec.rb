# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Vote, :type => :model do

  let(:user) {create(:user)}
  let(:talk) {create(:talk)}

  it "user can only vote once" do 
    votes = talk.votes_count
    user.vote_for(talk)
    expect(talk.reload.votes_count).to eq(votes + 1)
  end

  it "user can vote only once per item" do
    votes = talk.votes_count
    user.vote_for(talk)
    expect{user.vote_for(talk)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
