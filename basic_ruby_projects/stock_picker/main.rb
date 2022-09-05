# https://www.theodinproject.com/lessons/ruby-stock-picker

puts 'Stock picker'

def days_filter (buy_day, buy_price, max_profit, residual_prices, buy_sell)
  max_price_to_sell = residual_prices.max
  profit = max_price_to_sell - buy_price

  return [max_profit, buy_sell] if profit < max_profit

  max_profit = profit
  sell_day = residual_prices.find_index(max_price_to_sell) + buy_day + 1
  buy_sell = [buy_day, sell_day]
  [max_profit, buy_sell]
end

def stock_picker(prices)
  buy_sell = []
  max_profit = 0

  prices.each_with_index do |buy_price, buy_day|
    residual_prices = prices[buy_day + 1..]

    break if residual_prices.empty?

    analysis = days_filter(buy_day, buy_price, max_profit, residual_prices, buy_sell)
    max_profit = analysis[0]
    buy_sell = analysis[1]
  end

  buy_sell
end
