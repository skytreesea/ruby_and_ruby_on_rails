# 기본전제
# 5년 증가 기준
year = 5
#증가율
$increase_labor = 1.0322
$increase_price = 1.0107
# 사업명
name_business = "체육사업1"

#첫해 현행/공단 영업수익입력
current_sales_fy =  1000
public_sales_fy =  1200

#현행 수지 계산
current_labor_costs_fy =  5000
current_operation_cost_fy = 5020

#공단방식 수지 계산
public_labor_costs_fy =  4400
public_operation_cost_fy = 5000

#현행 수지계산
current_cost_fy = current_operation_cost_fy + current_labor_costs_fy 
current_profit_fy = current_sales_fy - current_labor_costs_fy - current_operation_cost_fy

#공단 수지계산
public_cost_fy = public_operation_cost_fy + public_labor_costs_fy 
public_profit_fy = public_sales_fy - public_labor_costs_fy - public_operation_cost_fy

# 5년 증가율 계산
current_sales = Array.new(year) { |n| n = (current_sales_fy * $increase_labor ** n).round }

current_cost = Array.new(year) { |n| n = (current_cost_fy * $increase_price ** n).round }
current_profit = Array.new(year) { |n| n =  current_sales[n] - current_cost[n] }
current_rate = Array.new(year) { |n| n = ((current_sales[n].to_f / current_cost[n].to_f)*100).round(2)}

puts "######{name_business} 현행방식 #{year}년 수지#####"
puts "영업수입 #{current_sales}" 
puts "영업비용 #{current_cost}"
puts "영업이익 #{current_profit}"
puts "수지비율 #{current_rate}%"

# 5년 증가율 계산
public_sales = Array.new(year) { |n| n = (public_sales_fy * $increase_labor ** n).round }

public_cost = Array.new(year) { |n| n = (public_cost_fy * $increase_price ** n).round }
public_profit = Array.new(year) { |n| n =  public_sales[n] - public_cost[n] }
public_rate = Array.new(year) { |n| n = ((public_sales[n].to_f / public_cost[n].to_f)*100).round(2)}
suji = Array.new(year) { |n| n =  public_profit[n] - current_cost[n] }

puts "######{name_business} 공단방식 #{year}년 수지#####"
puts "영업수입 #{public_sales}" 
puts "영업비용 #{public_cost}"
puts "영업이익 #{public_profit}"
puts "수지비율 #{public_rate}%"

puts "#####수지개선효과#####"
puts "수지개선효과 #{suji}"
puts "수지개선효과 #{year}년   총 #{suji.instance_eval { reduce(:+) }}천원" 
puts "수지개선효과 #{year}년 평균 #{suji.instance_eval { reduce(:+) / year}}천원" 