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
    end

  end
end
