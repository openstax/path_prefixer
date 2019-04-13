require 'spec_helper'
require 'uri'

RSpec.describe 'url helpers', type: :request do

  context "request is prefixed" do
    let(:request_path) { "/a_prefix/url_helper/an_action" }

    it "should prefix url_helpers" do
      expect_url_helper_path("/a_prefix/url_helper/another_action")
      get(request_path)
    end

    it "should prefix path_helpers" do
      expect_path_helper_value("/a_prefix/url_helper/another_action")
      get(request_path)
    end
  end

  context "request is not prefixed" do
    let(:request_path) { "/url_helper/an_action" }

    it "should not prefix url_helpers" do
      expect_url_helper_path("/url_helper/another_action")
      get(request_path)
    end

    it "should not prefix path_helpers" do
      expect_path_helper_value("/url_helper/another_action")
      get(request_path)
    end
  end

  def expect_url_helper_path(value)
    expect_any_instance_of(UrlHelperController).to receive(:url_helper_was).with(
      "http://www.example.com#{value}"
    )
  end

  def expect_path_helper_value(value)
    expect_any_instance_of(UrlHelperController).to receive(:path_helper_was).with(
      "#{value}"
    )
  end

end
