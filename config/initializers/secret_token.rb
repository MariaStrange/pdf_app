# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PdfApp::Application.config.secret_key_base = '9e44282238ffed0518c89f29431399cae4b1c4aa8b9eb36593233ec515f18261e50c61e12387a936d9fec6226fa76b4ddee621a53c1dd729f44bec77fe702306'
