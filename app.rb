require "sinatra"
require "json"

get "/v2/catalog" do
  content_type :json
  {
    "services" => [{
      "name" => "mysql",
      "id" => "30ec619b-2e27-47a3-a0da-e49590181f14",
      "bindable" => true,
      "description" => "best mysql node ever, today",
      "plans" => [{
        "id" => "b70a7ad1-59c9-46f0-9d5b-990d70489876",
        "name" => "medium",
        "description" => "an everyday plan"
      }]
    }]
  }.to_json
end
