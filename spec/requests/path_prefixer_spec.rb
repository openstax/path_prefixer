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

end
