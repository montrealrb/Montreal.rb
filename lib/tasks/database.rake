namespace :database do
  desc 'Create a default user'
  task create_default_user: :environment do
    if User.default_user.present?
      puts 'The default user has already been created.'
    else
      User.create_default_user!
      puts 'The default user was created successfully.'
    end
  end

  desc 'Resets the counter cache of associations'
  task reset_counter_cache: :environment do
    Event.find_each { |event| Event.reset_counters(event.id, :talks) }
    Event.find_each { |event| Event.reset_counters(event.id, :sponsors) }
  end
end
