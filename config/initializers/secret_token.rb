# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#
# old, probably compromised, open on GitHub
# LpdcV2::Application.config.secret_token = '1c473202cb6c3abd8a0e6b6e7abd582eae10592e5ce8428c46df848047de96543edf76b98d77f6f4e928d53ab85cb06858afb8ac03a5de7291e10daa5910827c'
if secret_token = ENV['SECRET_TOKEN']
  # production env should define the secret token
  LpdcV2::Application.config.secret_token = secret_token
else
  # used for development
  LpdcV2::Application.config.secret_token = '9337470c9fdff55ca07e67299c279540487a023bdff5c1b46f01608fdc1677d1e41e407d44ad3c7ecc37b44bb414c8b04f9d1a1c214bbc070fa4f180e57221df'
end

