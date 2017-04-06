require 'sinatra'
require 'pry'
require 'rack/test'
require './services/calculator/calculator_factory'
require './services/calculator/base_calculator'
require './services/calculator/annuity_calculator'
require './services/calculator/standart_calculator'

get "/" do
  haml :welcome
end

post '/processing' do
  @result = CalculatorFactory.calculator(params[:calc])
  haml :result
end