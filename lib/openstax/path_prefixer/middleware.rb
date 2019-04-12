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

            env['PATH_INFO'].gsub!(/^\/#{prefix}/,'')
            env["openstax_path_prefixer_request_was_prefixed"] = true
          end
        end

        @app.call(env)
      end

    end
  end
end
