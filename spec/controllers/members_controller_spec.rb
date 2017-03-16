# frozen_string_literal: true
require "rails_helper"

RSpec.describe MembersController, type: :controller do
  let(:user) { create(:user) }
  let!(:member) { create(:member, user: user) }

  describe '#edit' do
    subject { get :edit }

    context 'user is authenticated' do
      before { sign_in user }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template :edit }
    end

    context 'user is a guest' do
      it { is_expected.to have_http_status(302) }
    end
  end
end
