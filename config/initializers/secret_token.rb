# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#
# old, probably compromised, open on GitHub
# LpdcV2::Application.config.secret_token = '1c473202cb6c3abd8a0e6b6e7abd582eae10592e5ce8428c46df848047de96543edf76b98d77f6f4e928d53ab85cb06858afb8ac03a5de7291e10daa5910827c'
begin
    token_file = Rails.root.to_s + "/secret_token"
    to_load = open(token_file).read
    LpdcV2::Application.configure do
        config.secret_token = to_load
    end
rescue LoadError, Errno::ENOENT => e
    raise "Secret token couldn't be loaded! Error: #{e}"
end
