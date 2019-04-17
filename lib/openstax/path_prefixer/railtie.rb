require 'rails/railtie'
require 'openstax/path_prefixer/middleware'

module OpenStax
  module PathPrefixer
    class Railtie < ::Rails::Railtie
      initializer 'openstax_path_prefixer.add_middleware' do
        config.app_middleware.insert_after Rack::ETag, OpenStax::PathPrefixer::Middleware
      end

      initializer 'openstax_path_prefixer.prefix_assets' do
        config.to_prepare do
          if OpenStax::PathPrefixer.configuration.prefix_assets
            Rails.application.configure {
              # So assets get built in the right folder and linked to in HTML
              config.assets.prefix = "/#{OpenStax::PathPrefixer.configuration.prefix}#{config.assets.prefix}"
              # So that asset helpers for images, etc get the prefix
              config.relative_url_root = "/#{OpenStax::PathPrefixer.configuration.prefix}"
            }
          end
        end
      end
    end
  end
end
