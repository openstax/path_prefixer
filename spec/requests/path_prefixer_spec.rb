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

  # context "Requests should get routed to the appropriate controllers" do
  #   it "should recieve profile info in show page" do
  #     expect_any_instance_of(DummyController).to receive(:an_action)
  #     get("/a_prefix/an_action")
  #   end

  #   # it "should be home page" do
  #   #   expect_any_instance_of(StaticPagesController).to receive(:home)
  #   #   request.get("/accounts")
  #   # end

  #   # it "should be start to sign up" do
  #   #   expect_any_instance_of(SignupController).to receive(:start)
  #   #   request.get("/accounts/signup")
  #   # end
  # end

  # xcontext "Request through /accounts should only be re routed when applicable" do
  #   it "shouldn\'t replace /accounts when not at the start of the path" do
  #     app_object = DummyApp.new
  #     expect(app_object).to receive(:call).with({'PATH_INFO' => '/blah/accounts', 'REQUEST_METHOD'=>'GET'})
  #     RemoveAccountsPathPrefix.new(app_object).call({'PATH_INFO' => '/blah/accounts', 'REQUEST_METHOD'=>'GET'})
  #   end

  #   it "should replace /accounts when at the start of the path" do
  #     app_object = DummyApp.new
  #     expect(app_object).to receive(:call).with({'PATH_INFO' => '/blah', 'REQUEST_METHOD'=>'GET'})
  #     RemoveAccountsPathPrefix.new(app_object).call({'PATH_INFO' => '/accounts/blah', 'REQUEST_METHOD'=>'GET'})
  #   end

  #   it "should replace /accounts when not at the start of the path once given twice" do
  #     app_object = DummyApp.new
  #     expect(app_object).to receive(:call).with({'PATH_INFO' => '/blah/accounts', 'REQUEST_METHOD'=>'GET'})
  #     RemoveAccountsPathPrefix.new(app_object).call({'PATH_INFO' => '/accounts/blah/accounts', 'REQUEST_METHOD'=>'GET'})
  #   end

  #   it "should render image" do
  #     app_object = DummyApp.new
  #     expect(app_object).to receive(:call).with({'PATH_INFO' => '/assets/bg-login.jpg', 'REQUEST_METHOD'=>'GET'})
  #     RemoveAccountsPathPrefix.new(app_object).call({'PATH_INFO' => '/accounts/assets/bg-login.jpg', 'REQUEST_METHOD'=>'GET'})
  #   end
  # end


end
