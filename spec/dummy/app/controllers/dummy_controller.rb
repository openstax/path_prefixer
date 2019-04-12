class DummyController < ApplicationController

  def root
  end

  def an_action
    has_query(URI(request.url).query)
  end

  def local_redirect_via_action
    redirect_to action: :an_action
  end

  def external_redirect
    redirect_to "http://rice.edu"
  end

  def local_redirect_via_path_string
    redirect_to "/an_action"
  end

  def local_redirect_via_full_url
    redirect_to an_action_url
  end

  def local_redirect_via_proc
    redirect_to proc { an_action_url }
  end

  def a_prefix_blah
  end

  def a_prefix_blah_redirect
    redirect_to action: :an_action
  end

  def has_query(query)
  end

end
