github_key = "e4c408c3586385c599ac"
github_secret = "a907fd169687f643a5ce9c3e436a38aff1971204"

google_key = "359006366881-1l50g7mgl5p8at2h7c1bmbr3dvsdp5gp.apps.googleusercontent.com"
google_secret = "GRHZUwV4ts7ipu-OwaUsxS0M"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"]
end