ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

Capybara.app = TaskManager

require 'database_cleaner'
DadabaseCleaner.strategy = :truncation, {except: %w[public.schema_migrations]}