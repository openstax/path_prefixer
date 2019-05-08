require 'spec_helper'
require 'uri'

RSpec.describe 'redirects', type: :request do

  context "when incoming request has the prefix" do

    it "should prefix within-app action-based redirects" do
      get("/a_prefix/local_redirect_via_action")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should not alter external redirects" do
      get("/a_prefix/external_redirect")
      expect(response.location).to eq "http://rice.edu"
    end

    it "should prefix within-app path string redirects" do
      get("/a_prefix/local_redirect_via_path_string")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should prefix within-app full URL string redirects" do
      get("/a_prefix/local_redirect_via_full_url")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should prefix within-app path helper redirects" do
      get("/a_prefix/local_redirect_via_path_helper")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should prefix within-app proc-based redirects" do
      get("/a_prefix/local_redirect_via_proc")
      expect(URI(response.location).path).to eq "/a_prefix/an_action"
    end

    it "should not prefix a host-less redirect that doesn't match a route" do
      get("/a_prefix/hostless_non_accounts_redirect")
      expect(URI(response.location).path).to eq "/books/physics"
    end

  end

  context "when incoming request does not have the prefix" do

    it "should not prefix within-app path helper redirects" do
      get("/local_redirect_via_path_helper")
      expect(URI(response.location).path).to eq "/an_action"
    end

    it "should not prefix action redirects" do
      get("/local_redirect_via_action")
      expect(URI(response.location).path).to eq "/an_action"
    end

    it "should not prefix path string redirects" do
      get("/local_redirect_via_path_string")
      expect(URI(response.location).path).to eq "/an_action"
    end

    it "should not prefix redirects if the original request starts with but " \
       "does not exactly match the prefix" do
      get("/a_prefix_blah_redirect")
      expect(URI(response.location).path).to eq "/an_action"
    end

  end

end
