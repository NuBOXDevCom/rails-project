Turnout.configure do |config|
  #config.app_root = '/some/path'
  #config.named_maintenance_file_paths = {app: 'tmp/app.yml', server: '/tmp/server.yml'}
  config.maintenance_pages_path = 'app/views/maintenance'
  config.default_maintenance_page = Turnout::MaintenancePage::HTML
  config.default_reason = "Le site est actuellement en cours de maintenance.\nMerci de repasser ultérieurement."
  config.default_allowed_paths = []
  config.default_response_code = 503
  config.default_retry_after = 3600
end