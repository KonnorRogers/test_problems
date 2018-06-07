# given values, choose the best day to buy & best day to sell
# must buy before you can sell

# ie stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# returns [1, 4]
# buy on day 2, sell on day 5
# buy at 3, sell at 12
# 3 dollar profit

def stock_picker(days)
  profit = 0
  for i in 0...days.length # excludes the final value, easier than length - 1
    for j in (i + 1)...days.length # i+1 allows for i to be compared to j due to how for loops work
      next unless days[j] - days[i] > profit
      profit = days[j] - days[i]
      buy = i
      sell = j
    end
  end

  days = [buy, sell]
  puts days.to_s
  puts 'Best buy day is ' + buy.to_s
  puts 'Best sell day is ' + sell.to_s
  puts "profit is: $#{profit}"
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
