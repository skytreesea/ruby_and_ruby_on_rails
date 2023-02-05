require 'csv'
$year = 5
$first_year = 2024
# 최종 쓰기 
CSV.open("C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test4.csv", "w") do |csv|
    csv.to_io.write "\uFEFF"
    csv <<  ["현행방식"] 
    csv <<  ["구분","구분"] + Array.new($year){|n| (n + $first_year).to_s + "년"}
    csv <<  ["영업수익",""] 
    csv <<  ["영업비용","계"] 
    csv <<  ["","인건비"] 
    csv <<  ["","운영비"] 
    csv <<  ["영업이익",""] 
    csv <<  ["공단방식"]
    csv <<  ["영업수익",""] 
    csv <<  ["영업비용","계"] 
    csv <<  ["","인건비"] 
    csv <<  ["","운영비"] 
    csv <<  ["영업이익",""] 
    csv <<  ["경상수지비율",""] 
    csv <<  ["구분","구분"] + Array.new($year){|n| (n + $first_year).to_s + "년"}
    csv <<  ["현행","영업이익"] 
    csv <<  ["공단","영업이익"] 
    csv <<  ["수지개선효과",""] 
end