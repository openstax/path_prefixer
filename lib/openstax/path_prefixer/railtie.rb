require 'rails/railtie'
require 'openstax/path_prefixer/middleware'

module OpenStax
  module PathPrefixer
    class Railtie < ::Rails::Railtie
      initializer 'openstax_path_prefixer.add_middleware' do
        config.app_middleware.insert_after Rack::ETag, OpenStax::PathPrefixer::Middleware
      end
    end
  end
end
