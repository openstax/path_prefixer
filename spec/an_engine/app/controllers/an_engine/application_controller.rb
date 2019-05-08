module AnEngine
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def options
      head :ok
    end
  end
end
