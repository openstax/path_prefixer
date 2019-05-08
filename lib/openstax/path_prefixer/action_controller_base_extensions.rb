ActionController::Base.class_exec do

  # Copied from actionpack-5.2.3/lib/action_controller/metal/redirecting.rb
  def _compute_redirect_to_location(request, options) #:nodoc:
    case options
    # The scheme name consist of a letter followed by any combination of
    # letters, digits, and the plus ("+"), period ("."), or hyphen ("-")
    # characters; and is terminated by a colon (":").
    # See https://tools.ietf.org/html/rfc3986#section-3.1
    # The protocol relative scheme starts with a double slash "//".
    when /\A([a-z][a-z\d\-+\.]*:|\/\/).*/i
      options
    when String
      ##### BEGIN MODIFICATION FROM ORIGINAL RAILS CODE #####
      # Add the script name prefix unless it is already there or
      # if the path is not an app route path
      if request.script_name.present?
        already_has_prefix = options.match(/^#{request.script_name}/)

        unless already_has_prefix
          options_uri = URI(options)

          path_matches_a_route = Rails.application.routes.set.any? do |route|
            "GET".match(route.verb) &&
            route.path.match(options_uri.path)
          end

          if path_matches_a_route
            options = "#{request.script_name}#{options}"
          end
        end
      end
      ##### END MODIFICATION FROM ORIGINAL RAILS CODE   #####

      request.protocol + request.host_with_port + options
    when Proc
      _compute_redirect_to_location request, instance_eval(&options)
    else
      url_for(options)
    end.delete("\0\r\n")
  end

  alias_method :original_url_options, :url_options
  def url_options
    # Force the script_name to be in the URL options.  There are some times when
    # Rails chooses not to, for some inexplicable reasons.  This was added due
    # to real testing in openstax/accounts; not particularly spec'd here.
    original_url_options.dup.tap{|options| options[:script_name] = request.script_name}
  end

end

