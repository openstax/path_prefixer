ActionController::Base.class_exec do

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
      options =
        if request.env["openstax_path_prefixer_already_prefixed"]
          options
        else
          request.env["openstax_path_prefixer_already_prefixed"] = true
          "/#{OpenStax::PathPrefixer.configuration.prefix}#{options}"
        end
      ##### END MODIFICATION FROM ORIGINAL RAILS CODE   #####

      request.protocol + request.host_with_port + options
    when Proc
      _compute_redirect_to_location request, instance_eval(&options)
    else
      url_for(options)
    end.delete("\0\r\n")
  end

end
