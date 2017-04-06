class BaseCalculator
  attr_reader :months

  def initialize(params)
    @rate = params[:credit_rate].to_f / 100
    @month_rate = @rate / 12
    @credit_amount = params[:credit_amount].to_f
    @term = params[:credit_term].to_i
    @months = []
    process
  end

  def total_body_paid
    @months.inject(0){ |sum, month| sum + month.credit_body }
  end

  def total_percent_paid
    @months.inject(0){ |sum, month| sum + month.percent }
  end
end