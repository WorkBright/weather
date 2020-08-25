require 'rails_helper'

RSpec.describe "Home Page Request Tests", type: :request do
  describe "GET /" do
    it "shows the homepage content" do
      get root_path

      expect(response.body).to include("Welcome to the Weather App")
      expect(response.body).to include("Have fun and code well!")
    end
  end
end
