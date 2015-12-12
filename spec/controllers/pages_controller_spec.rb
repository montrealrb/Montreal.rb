require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context 'when accessing a published page' do
    let(:published_page) { create :page, state: 'published' }

    it 'returns a 200 status code' do
      get :show, id: published_page
      expect(response).to have_http_status(200)
    end
  end

  context 'when accessing a non-published page' do
    let(:draft_page) { create :page, state: 'draft' }
    let(:archived_page) { create :page, state: 'draft' }

    it 'raises a RecordNotFound error' do
      [draft_page, archived_page].each do |page|
        expect do
          get :show, id: page
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
