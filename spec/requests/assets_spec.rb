require 'spec_helper'
require 'uri'

RSpec.describe 'assets', type: :request do

  it "prefixes assets URLs" do
    get("/a_prefix/an_action")
    expect(response.body).to match("src=\"/a_prefix/assets/")
  end

end
