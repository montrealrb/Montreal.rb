require 'rails_helper'

RSpec.describe Location, :type => :model do
  it 'defaults to a draft state' do
    expect(Page.new.state).to eq 'draft'
  end
end
