# frozen_string_literal: true

require "rails_helper"

RSpec.describe TalksController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe "GET #new" do
    subject { get :new }
    it { is_expected.to have_http_status :success }
    it { is_expected.to render_template :new }

    context "when the user does not have a profile" do
      let(:user) { create :user, member: nil }

      it { is_expected.to redirect_to edit_member_path }
    end
  end

  describe "POST #create" do
    let(:talk) { attributes_for :talk }
    subject { post :create, params: { talk: talk } }

    it { is_expected.to redirect_to Talk.last }

    it "creates the talk" do
      expect { subject }.to change(Talk, :count)
    end

    describe "the newly created talk" do
      subject { Talk.last }
      before { post :create, params: { talk: talk  } }

      its(:member) { is_expected.to eq user.member }
      its(:state)  { is_expected.to eq :proposed   }
    end

    describe "with invalid attributes" do
      subject { post :create, params: { talk: { title: nil } } }

      it { is_expected.to render_template :new }

      it "creates the talk" do
        expect { subject }.not_to change(Talk, :count)
      end
    end
  end

  describe "GET #show" do
    let(:talk) { create :talk }
    subject { get :show, params: { id: talk.id } }
    it { is_expected.to have_http_status :success }
    it { is_expected.to render_template :show }
  end
end
