# Be sure to restart your server when you modify this file.

#Rewards::Application.config.session_store :cookie_store, :key => '_rewards_session'

require 'action_dispatch/middleware/session/dalli_store'
Rails.application.config.session_store :dalli_store, :memcache_server => ['127.0.0.1:11211']

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Rewards::Application.config.session_store :active_record_store
