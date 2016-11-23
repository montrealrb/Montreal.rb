# frozen_string_literal: true
require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_one :member }

  describe ".from_omniauth" do
    let(:auth) do
      double(:auth, provider: "Github",
                    uid: "aksjdf",
                    info: double(:info, email: "an_email@provider.com"))
    end

    subject { described_class.from_omniauth(auth) }

    context "when the user exists with auth uid" do
      let!(:user) { create(:user, provider: auth.provider, uid: auth.uid) }

      it { expect { subject }.to_not change(User, :count) }

      its(:id) { is_expected.to eq user.id }
    end

    context "when the user exists with only email" do
      let!(:user) { create(:user, provider: nil, uid: nil, email: auth.info.email) }

      it { expect { subject }.to_not change(User, :count) }

      its(:id)       { is_expected.to eq user.id       }
      its(:uid)      { is_expected.to eq auth.uid      }
      its(:provider) { is_expected.to eq auth.provider }
    end

    context "when the user does not exist" do
      it { expect { subject }.to change(User, :count) }

      it { is_expected.to be_a User    }
      it { is_expected.to be_persisted }

      its(:uid)      { is_expected.to eq auth.uid        }
      its(:provider) { is_expected.to eq auth.provider   }
      its(:email)    { is_expected.to eq auth.info.email }
    end
  end
end
