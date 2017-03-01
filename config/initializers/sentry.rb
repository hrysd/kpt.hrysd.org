if defined?(Raven) && ENV['RAVEN_DSN'].present?
  Raven.configure do |config|
    config.dsn = ENV['RAVEN_DSN']
    config.environments = %w(production)
  end
end
