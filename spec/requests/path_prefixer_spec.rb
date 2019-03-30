require 'spec_helper'

RSpec.describe 'path prefixer', type: :request do

  it "should route requests that have the prefix" do
    expect_any_instance_of(DummyController).to receive(:an_action)
    get("/a_prefix/an_action")
  end

  it "should route requests that don't have the prefix" do
    expect_any_instance_of(DummyController).to receive(:an_action)
    get("/an_action")
  end

end
