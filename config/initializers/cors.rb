Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # 🔒 Tu peux restreindre ça à 'http://localhost:3000' par exemple

    resource '*',
      headers: :any,
      expose: ['Authorization'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
