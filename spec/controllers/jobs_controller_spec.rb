# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobsController, type: :controller do
  let(:draft_job) { create(:job, :draft) }
  let!(:published_job) { create(:job, :published) }
  let(:archived_job) { create(:job, :archived) }

  describe "GET #index" do
    before :each do
      get :index
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "includes published_job in response" do
      expect(assigns(:jobs)).to include published_job
    end

    it "does not include unpublished in jobs" do
      expect(assigns(:jobs)).not_to include draft_job
    end

    it "does not include archived in jobs" do
      expect(assigns(:jobs)).not_to include archived_job
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      get :show, params: { id: published_job.id }
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "assigns the requested published_job to @job" do
      expect(assigns(:job)).to eq published_job
    end

    context "when accessing a non-published news_item" do
      it "raises a RecordNotFound error" do
        [draft_job, archived_job].each do |job|
          expect do
            get :show, params: { id: job }
          end.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    subject { get :new }

    context "when the user is logged in" do
      let(:user) { create :user }
      before { sign_in user }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :new }
    end

    context "whent the user is logged out" do
      it { is_expected.to redirect_to new_user_session_url }
    end
  end

  describe "POST #create" do
    let(:post_request) { post :create, params: jobs_params }
    subject { post_request }

    context "when the user is logged in" do
      let(:user) { create :user }
      before { sign_in user }

      context "with valid attributes" do
        let(:jobs_params) do
          {
            job: {
              title: "123",
              description: "456",
              organization_attributes: { name: "789", address: "abc" }
            }
          }
        end

        it { is_expected.to redirect_to confirmation_job_url(Job.last) }

        it "creates the job" do
          expect { subject }.to change(Job, :count)
        end

        it "creates an organization" do
          expect { subject }.to change(Organization, :count)
        end

        describe "the newly created job" do
          subject { Job.last }
          before { post_request }

          its(:title) { is_expected.to eq "123" }
          its(:state) { is_expected.to eq :draft }
        end

        context "when the organization already exist" do
          let!(:organization) { create :organization, name: "Existing Company" }
          let(:jobs_params) do
            {
              job: {
                title: "123",
                description: "456",
                organization_attributes: { name: "Existing Company", address: "abc" }
              }
            }
          end

          it "creates the job" do
            expect { subject }.to change(Job, :count)
          end

          it "does not creates a new organization" do
            expect { subject }.not_to change(Organization, :count)
          end

          describe "the newly created job" do
            subject { Job.last }
            before { post_request }

            its(:organization_id) { is_expected.to eq organization.id }
          end
        end
      end

      context "with invalid attributes" do
        let(:jobs_params) do
          {
            job: {
              title: "123"
            }
          }
        end

        it { is_expected.to render_template :new }

        it "doesn't create a new job" do
          expect { subject }.not_to change(Job, :count)
        end
      end
    end

    context "when the user is logged out" do
      let(:jobs_params) { {} }
      it { is_expected.to redirect_to new_user_session_url }
    end
  end

  describe "GET #confirmation" do
    let(:job) { create(:job) }
    subject { get :confirmation, params: { id: job.id } }

    context "when user is logged in" do
      let(:user) { create :user }
      before { sign_in user }

      context "when draft job" do
        before { job.update!(state: :draft) }

        context "when is current user posting" do
          before { job.update!(author: user) }

          it { is_expected.to render_template :show }
        end

        context "when is not current user posting" do
          it { is_expected.to redirect_to jobs_url }
        end
      end

      context "when published job" do
        before { job.update!(state: :published) }

        it { is_expected.to redirect_to jobs_url }
      end

      context "when no job found" do
        it "raises a RecordNotFound error" do
          expect do
            get :confirmation, params: { id: 42 }
          end.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    context "when user is logged out" do
      it { is_expected.to redirect_to jobs_url }
    end
  end
end
