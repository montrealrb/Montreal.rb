# frozen_string_literal: true
require "rails_helper"

RSpec.describe Admin::ContactsController, type: :controller do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:valid_attributes) { attributes_for(:contact).merge(author: nil) }

  before do
    login_user(admin)
  end

  describe "POST #create" do
    it "creates a new contact" do
      expect do
        post :create, contact: valid_attributes
      end.to change(Contact, :count).by(1)
    end

    it "assigns the current user to the 'author' field" do
      post :create, contact: valid_attributes

      expect(Contact.last.author).to eq admin
    end
  end

  describe "PUT #update" do
    let(:contact) { create :contact }

    it "assigns the current user to the 'author' field" do
      put :update, id: contact.id, contact: contact.attributes

      expect(contact.reload.author).to eq admin
    end
  end
end
