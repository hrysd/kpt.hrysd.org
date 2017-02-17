if define?(Raven)
  Raven.configure do |config|
    config.dsn = ENV['RAVEN_DSN']
    config.environments = %w(production)
  end
end
