require 'spec_helper'

RSpec.describe OpenStax::PathPrefixer::Middleware do

  let(:app) { MockApp.new }

  before {
    allow_any_instance_of(OpenStax::PathPrefixer::Configuration).to receive(:prefix) { "a_prefix" }
  }

  it "shouldn't remove prefix when not at the start of the path" do
    expect_path('/blah/a_prefix')
    call_with_path('/blah/a_prefix')
  end

  it "should replace prefix when at the start of the path" do
    expect_path('/blah')
    call_with_path('/a_prefix/blah')
  end

  it "should replace prefix only at the start of the path when given twice" do
    expect_path('/blah/a_prefix')
    call_with_path('/a_prefix/blah/a_prefix')
  end

  def expect_path(path)
    expect(app).to receive(:call).with(a_hash_including('PATH_INFO' => path))
  end

  def call_with_path(path)
    described_class.new(app).call({'PATH_INFO' => path})
  end

end





