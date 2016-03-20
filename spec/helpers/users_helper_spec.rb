require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe 'gravatar_for' do
    let!(:member)     { create :member}
    let(:gravatar_id) { Digest::MD5::hexdigest(member.email.downcase) }

    it 'generates the right image tag' do
      expect(gravatar_for(member)).to include "alt=\"#{member.name}\""
      expect(gravatar_for(member)).to include 'class="gravatar"'
      expect(gravatar_for(member, size: 100)).to include "src=\"https://secure.gravatar.com/avatar/#{gravatar_id}?s=100\""
    end
  end
end
