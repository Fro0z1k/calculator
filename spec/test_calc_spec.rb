require_relative "spec_helper"
require_relative "../test_calc.rb"

describe "My TestCalc Application" do

  it "should allow accessing the home page" do
    get "/"
    expect(last_response.status).to eq(200)
  end
  
end