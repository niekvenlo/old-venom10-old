# TODO: Environmental variables

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, google_key, google_secret
  provider :github, github_key, github_secret
end