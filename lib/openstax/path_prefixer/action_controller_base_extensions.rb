ActionController::Base.class_exec do

  alias_method :_original_compute_redirect_to_location, :_compute_redirect_to_location
  def _compute_redirect_to_location(request, options) #:nodoc:
    location = _original_compute_redirect_to_location(request, options)

    location_uri = URI(location)

    # If we have already been in this method and prefixed, just return; can happen
    # b/c the original method is recursive.  We only want to prefix once.
    return location if request.env["openstax_path_prefixer_already_prefixed"]

    # Don't prefix if the redirected location is at an external site
    return location if location_uri.host != request.host

    # Don't prefix if the request wasn't prefixed
    return location if !request.env["openstax_path_prefixer_request_was_prefixed"]

    # Do the prefixing and remember that we did it
    location_uri.path = "/#{OpenStax::PathPrefixer.configuration.prefix}#{location_uri.path}"
    request.env["openstax_path_prefixer_already_prefixed"] = true

    location_uri.to_s
  end

end
