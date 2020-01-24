class StoresController < ApplicationController
  before_action :set_store

  def total_pirce_last_week
    total_arr = []
    total_priice_sum = @store.orders.where(created_at: 1.week.ago .. Time.now.end_of_day).group('created_at::date').sum(:total_price)

    total_priice_sum.each { |key,value| total_arr.append({ day: key, value: value }) }
    total_arr.sort! { |a, b| a[:day].wday <=> b[:day].wday }
    json_response({data: total_arr}, :ok)
  end

  def employees

    json_response({data: total_arr}, :ok)
  end

  private 

  def set_store
    @store = Store.find(params[:store_id])
  end
end
