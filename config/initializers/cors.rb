Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:8080'  # Replace with your Vue.js app's URL
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options]
  end
end