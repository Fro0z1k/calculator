module CalculatorFactory
  
  class << self

    def calculator( params )
      if params[:calc_method] == 'standart'
        StandartCalculator.new(params)
      else
        AnnuityCalculator.new(params)
      end
    end

  end
  
end