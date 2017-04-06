require_relative "spec_helper"
require_relative "../test_calc.rb"

describe "My TestCalc Application" do

  it "should allow accessing the home page" do
    get "/"
    expect(last_response.status).to eq(200)
  end

  it "should be selected Standard calculator" do
    expect(CalculatorFactory.calculator(calc_method: 'standart')).to be_instance_of StandartCalculator
  end

  it "should be selected Annuity calculator" do
    expect(CalculatorFactory.calculator(calc_method: '')).to be_instance_of AnnuityCalculator
  end

  it "should be response on monthly sum StandartCaclulator" do
    params = { credit_rate: '2.7', credit_amount: '6500', credit_term: '4', calc_method: 'standart' }
    expect(CalculatorFactory.calculator(params).months[0].credit_left.round(2)).to eq(4875.0)
    expect(CalculatorFactory.calculator(params).months[1].credit_left.round(2)).to eq(3250.0)
    expect(CalculatorFactory.calculator(params).months[2].credit_left.round(2)).to eq(1625.0)
    expect(CalculatorFactory.calculator(params).months[3].credit_left.round(2)).to eq(0.0)
  end

  it "should be body credit 1625.0" do
    sum = 1625.0
    params = { credit_rate: '2.7', credit_amount: '6500', credit_term: '4', calc_method: 'standart' }
    expect(CalculatorFactory.calculator(params).months[0].credit_body.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[1].credit_body.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[2].credit_body.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[3].credit_body.round(2)).to eq(sum)
  end

  it "should be response on general contribution sum AnnuityCaclulator 2018.71" do
    sum = 2018.71
    params = { credit_rate: '3.2', credit_amount: '12000', credit_term: '6' }
    expect(CalculatorFactory.calculator(params).months[0].total.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[1].total.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[2].total.round(2)).to eq(sum)
    expect(CalculatorFactory.calculator(params).months[3].total.round(2)).to eq(sum)
  end

  it "should be response on loan balance sum AnnuityCaclulator" do
    params = { credit_rate: '3.2', credit_amount: '12000', credit_term: '6' }
    expect(CalculatorFactory.calculator(params).months[0].credit_left.round(2)).to eq(10013.29)
    expect(CalculatorFactory.calculator(params).months[1].credit_left.round(2)).to eq(8021.29)
    expect(CalculatorFactory.calculator(params).months[2].credit_left.round(2)).to eq(6023.97)
    expect(CalculatorFactory.calculator(params).months[3].credit_left.round(2)).to eq(4021.32)
    expect(CalculatorFactory.calculator(params).months[4].credit_left.round(2)).to eq(2013.34)
    expect(CalculatorFactory.calculator(params).months[5].credit_left.round(2)).to eq(0.0)
  end
  
end