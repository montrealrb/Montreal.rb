namespace :jobs do
  desc 'Populate published_at field'
  task populate_job_field: :environment do
    Job.where(published_at: nil, state: :published)
       .find_each { |job| job.update(published_at: job.updated_at) }
  end
end
