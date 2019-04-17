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
      # Add the script name prefix unless it is alread there
      options = "#{request.script_name}#{options}" unless options.match(/^#{request.script_name}/)
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

