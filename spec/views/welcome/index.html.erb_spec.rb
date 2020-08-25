require 'rails_helper'

RSpec.describe "welcome/index", type: :view do
  it "renders an H1 with welcome text" do
    render
    expect(rendered).to include("<h1>Welcome to the Weather App</h1>")
  end

  it "renders a 'Have fun and code well!'" do
    render
    expect(rendered).to include("<p>Have fun and code well!</p>")
  end
end
