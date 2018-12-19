require 'rails_helper'

RSpec.describe Meetup::BaseJob, type: :job do
  include ActiveJob::TestHelper

  let(:fake_job) { Class.new(described_class) }

  describe '#perform' do
    it 'raises an error' do
      expect { fake_job.perform_now }.to raise_error(Exception)
    end
  end

  describe 'queueing' do
    it 'queues the job' do
      expect {
        fake_job.perform_later
      }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'queues as :default' do
      expect(fake_job.new.queue_name).to eq('default')
    end
  end
end
