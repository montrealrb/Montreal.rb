# frozen_string_literal: true
require "rails_helper"

RSpec.describe MembersController, type: :controller do
  let(:user) { create(:user) }
  let(:member) { user.member }

  describe "#edit" do
    subject { get :edit }

    context "user is authenticated" do
      before { sign_in user }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template :edit }
    end

    context "user is a guest" do
      it { is_expected.to have_http_status(302) }
    end
  end

  describe "#update" do
    subject { post :update, params: { member: { twitter_handle: "RailsbridgeMTL" } } }

    context "user is authenticated" do
      before { sign_in user }

      it { is_expected.to redirect_to edit_member_path }

      it "updates the member" do
        expect { subject }.to(change { member.reload.twitter_handle })
      end

      context "with invalid attributes" do
        subject { post :update, params: { member: { name: nil } } }

        it { is_expected.to render_template :edit }

        it "updates the member" do
          expect { subject }.to_not(change { member.reload.twitter_handle })
        end
      end
    end

    context "user is a guest" do
      it { is_expected.to have_http_status(302) }
    end
  end
end
