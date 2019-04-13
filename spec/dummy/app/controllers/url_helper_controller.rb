class UrlHelperController < ApplicationController

  def an_action
    url_helper_was(another_action_url_helper_index_url)
    path_helper_was(another_action_url_helper_index_path)
  end

  def another_action
  end

  def url_helper_was(value)
    # exists to analyze value
  end

  def path_helper_was(value)
    # exists to analyze value
  end

end
