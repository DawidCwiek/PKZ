class StoresController < ApplicationController
  before_action :set_store

  def total_pirce_last_week
    total_arr = []
    total_priice_sum = @store.orders.where(created_at: 1.week.ago .. Time.now.end_of_day).group('created_at::date').sum(:total_price)

    total_priice_sum.each { |key,value| total_arr.append({ day: key.strftime("%A"), value: value }) }
    total_arr.sort! { |a, b| Date.strptime("#{a[:day]}", '%A').wday <=> Date.strptime("#{b[:day]}", '%A').wday }
    json_response({data: total_arr}, :ok)
  end

  private 

  def set_store
    @store = Store.find(params[:store_id])
  end
end
