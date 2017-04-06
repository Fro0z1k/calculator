class StandartCalculator < BaseCalculator

  def process
    @months = []
    1.upto @term do |month_num|
      month = OpenStruct.new
      @months << month
      month.num = month_num
      month.credit_body = monthly_body
      month.percent = percent_for_month(month_num)
      month.total = (month.percent + month.credit_body)
      month.credit_left = (@credit_amount - total_body_paid)
    end
  end

  def percent_for_month(month_num)
    (@credit_amount - (@credit_amount / @term) * (month_num - 1)) * @month_rate
  end

  def monthly_body
    @body_form_month ||= (@credit_amount/ @term)
  end
end