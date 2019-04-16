require 'openstax/path_prefixer/railtie'
require 'openstax/path_prefixer/action_controller_base_extensions'

module OpenStax
  module PathPrefixer

    def self.configure
      yield configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    class Configuration
      attr_accessor :prefix
      attr_accessor :prefix_assets

      def initialize
        @prefix = ""
        @prefix_assets = Rails.env.test? ? true : false
      end
    end

  end
end
