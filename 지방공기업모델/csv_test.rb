require 'csv' 
path = "C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test_value.csv"
table = CSV.read( path)
for i in (1...table.length)
    table[i][2..] = table[i][3..].map(&:to_f )
end
#현행 영업수입
p table[3][2..]
#현행 인건비
p table[4][2..]
#현행 운영비
p table[5][2..]
#공단 영업수입
p table[3][2..]
#공단 인건비
p table[4][2..]
#공단 운영비
p table[5][2..]
