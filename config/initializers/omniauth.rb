OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '494367717013-b2br18jllr8up6e0rup99jj57ts6i4b3.apps.googleusercontent.com', 'vM0n4OXeatG-M6DL5z6-emlT', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end