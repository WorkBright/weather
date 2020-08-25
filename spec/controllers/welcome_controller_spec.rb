require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET /" do
    it "returns 200 success" do
      get :index
      expect(response).to be_success
    end

    it "renders the root page" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
