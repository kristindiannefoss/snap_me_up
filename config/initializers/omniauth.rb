Rails.application.config.middleware.use OmniAuth::Builder do
  provider :team_snap,
           Rails.application.secrets.client_id,
           Rails.application.secrets.client_secret
end
