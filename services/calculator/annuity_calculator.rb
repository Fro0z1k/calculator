class AnnuityCalculator < BaseCalculator

  def process
    total_per_month = month_total

    1.upto @term do |month_num|
      month = OpenStruct.new
      @months << month
      month.num = month_num
      month.percent = percent_for_month
      month.total = total_per_month
      month.credit_body = (month.total - month.percent)
      month.credit_left = (@credit_amount - month.credit_body)
      @credit_amount = month.credit_left
    end
  end

  def percent_for_month
    @credit_amount * @month_rate
  end

  def month_total
    @credit_amount * @month_rate / (1 - (1 /(1 + @month_rate))**@term )
  end
end