module OpenStax
  module PathPrefixer
    class Middleware

      def initialize(app, options = {})
        @app = app
      end

      def call(env)
        prefix = OpenStax::PathPrefixer.configuration.prefix

        if env['PATH_INFO'].present? && !prefix.blank?
          if env['PATH_INFO'] == "/#{prefix}" ||
             env['PATH_INFO'].starts_with?("/#{prefix}/")

            # Take the prefix out so that the request routes appropriately
            env['PATH_INFO'].gsub!(/^\/#{prefix}/,'')
            # set the script name so that URL and path helpers prepend the prefix
            env['SCRIPT_NAME'] = "/#{prefix}"
          end
        end

        @app.call(env)
      end

    end
  end
end
