# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_guardians_session',
  :secret      => 'ab570e65af95db546e5ea2a0fb6057f1343ffd4e9878efcdb5505f2e97144587368939163ce90cbc4075a3ffa20ff6634433917872d895d7e3329467574e4127'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
