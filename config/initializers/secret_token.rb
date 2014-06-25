# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
      # Use the existing token.
	File.read(token_file).chomp
    else
      # Generate a new token and store it in token_file.
      token = SecureRandom.hex(64)
      File.write(token_file, token)
      token
    end
end

FirstApp::Application.config.secret_key_base = secure_token

# FirstApp::Application.config.secret_key_base = '3a6420c67d59b29fbea6765bc7e43dd216a95cd1041efa39a39e33aaf8b50af4e5ae2d1b531ca45ba706bdc5a77ff037f963a3f669e6beacdbf9b003d3c1662f'
