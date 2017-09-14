# frozen_string_literal: true
require "factory_girl_rails"

FactoryGirl.create(:user, email: "user@example.com", password: "password")
FactoryGirl.create(:user, :admin, email: "admin@example.com", password: "password")

FactoryGirl.create(:job, :published)
FactoryGirl.create(:news_item, :published)
FactoryGirl.create(:news_item, :slugged)

FactoryGirl.create_list(:event, rand(5..20))
FactoryGirl.create_list(:job, rand(5..20))
FactoryGirl.create_list(:location, rand(5..20))
FactoryGirl.create_list(:news_item, rand(5..20))
FactoryGirl.create_list(:organization, rand(5..20))
FactoryGirl.create_list(:page, rand(5..20))
FactoryGirl.create_list(:user, rand(5..20))
