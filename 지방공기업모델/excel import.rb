require 'csv'
$year = 5
table = CSV.parse(File.read("C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test_value.csv"), headers: true)
p table
p business1 = table["사업1"].map{|x| x.to_i}[2..2+$year]
p business2 = table["사업2"].map{|x| x.to_i}[2..2+$year]


CSV.open("C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test2.csv", "w") do |csv|
csv.to_io.write "\uFEFF"
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row","한글"]
end