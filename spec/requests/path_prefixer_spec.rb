require 'spec_helper'
require 'uri'

RSpec.describe 'path prefixer', type: :request do

  it "should route requests that have the prefix" do
    expect_any_instance_of(DummyController).to receive(:an_action)
    get("/a_prefix/an_action")
  end

  it "should route requests that don't have the prefix" do
    expect_any_instance_of(DummyController).to receive(:an_action)
    get("/an_action")
  end

  it "should route requests that have the prefix alone with a trailing slash" do
    expect_any_instance_of(DummyController).to receive(:root)
    get("/a_prefix/")
  end

  it "should route requests that have the prefix alone without a trailing slash" do
    expect_any_instance_of(DummyController).to receive(:root)
    get("/a_prefix")
  end

  it "should route requests that have the prefix and a query" do
    expect_any_instance_of(DummyController).to receive(:an_action).and_call_original
    expect_any_instance_of(DummyController).to receive(:has_query).with("q=42")
    get("/a_prefix/an_action?q=42")
  end

  it "should reroute requests that start with but don't exactly match the prefix" do
    expect_any_instance_of(DummyController).to receive(:a_prefix_blah)
    get("/a_prefix_blah")
  end

  context "redirects" do
    it "should redirect within-app action-based requests using the prefix" do
      get("/a_prefix/local_redirect_via_action")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should not alter external redirects" do
      get("/a_prefix/external_redirect")
      expect(response.location).to eq "http://rice.edu"
    end

    it "should redirect within-app path string requests using the prefix" do
      get("/a_prefix/local_redirect_via_path_string")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should redirect within-app full URL string requests using the prefix" do
      get("/a_prefix/local_redirect_via_full_url")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should redirect within-app proc-based requests using the prefix" do
      get("/a_prefix/local_redirect_via_proc")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should not prefix redirects if the original request isn't prefixed" do
      get("/local_redirect_via_action")
      expect(URI(response.location).path).to eq "/an_action"
    end

    it "should not prefix redirects if the original request starts with but " \
       "does not exactly match the prefix" do
      get("/a_prefix_blah_redirect")
      expect(URI(response.location).path).to eq "/an_action"
    end
  end

end
