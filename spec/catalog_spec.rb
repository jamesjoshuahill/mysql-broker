require_relative "../app"
require 'rack/test'

RSpec.describe "Catalog" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "GET /v2/catalog" do
    before(:each) { get "/v2/catalog" }

    it "returns 200" do
      expect(last_response).to be_ok
    end

    it "returns a JSON body" do
      expect(last_response.content_type).to eq("application/json")
    end

    it "returns one service" do
      body = JSON.parse(last_response.body)
      expect(body["services"].count).to eq 1
    end

    context "returns a mysql service" do
      it "has all the required response fields" do
        body = JSON.parse(last_response.body)
        expect(body["services"].first).to include({
          "name" => "mysql",
          "id" => "30ec619b-2e27-47a3-a0da-e49590181f14",
          "description" => "best mysql node ever, today",
          "bindable" => true
        })
      end

      it "has one plan with all the required response fields" do
        body = JSON.parse(last_response.body)
        expect(body["services"].first["plans"]).to match([{
          "id" => "b70a7ad1-59c9-46f0-9d5b-990d70489876",
          "name" => "medium",
          "description" => "an everyday plan"
        }])
      end
    end
  end
end
