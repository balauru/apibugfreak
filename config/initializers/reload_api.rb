if Rails.env.development? || Rails.env.test?

	ActiveSupport::Dependencies.explicitly_unloadable_constants << "Twitter::API"

	api_files = Dir["#{Rails.root}/app/api/**/*.rb"]
	api_reloader = ActiveSupport::FileUpdateChecker.new(api_files) do
		Rails.application.reload_routes!
	end
	ActionDispatch::Callbacks.to_prepare do
		api_reloader.execute_if_updated
	end

end