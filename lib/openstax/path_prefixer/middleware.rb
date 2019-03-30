module OpenStax
  module PathPrefixer
    class Middleware

      def initialize(app, options = {})
        @app = app
      end

      def call(env)
        prefix = OpenStax::PathPrefixer.configuration.prefix

        if env['PATH_INFO'].present? && !prefix.blank?
          env['PATH_INFO'].gsub!(/^\/#{prefix}/,'')
        end

        @app.call(env)
      end

    end
  end
end
