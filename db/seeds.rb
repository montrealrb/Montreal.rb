# frozen_string_literal: true

require "factory_girl_rails"

FactoryBot.create(:user, email: "user@example.com", password: "password")
FactoryBot.create(:user, :admin, email: "admin@example.com", password: "password")

FactoryBot.create(:job, :published)
FactoryBot.create(:news_item, :published)
FactoryBot.create(:news_item, :slugged)

FactoryBot.create_list(:event, rand(5..20))
FactoryBot.create_list(:job, rand(5..20))
FactoryBot.create_list(:location, rand(5..20))
FactoryBot.create_list(:news_item, rand(5..20))
FactoryBot.create_list(:organization, rand(5..20))
FactoryBot.create_list(:page, rand(5..20))
FactoryBot.create_list(:user, rand(5..20))
