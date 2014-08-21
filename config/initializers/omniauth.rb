# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['5a62ec669f9684ead5d4'], ENV['1b2899023c2a2b8a17640c5301167a1c28815537'], scope: "user:email,user:follow"
end

