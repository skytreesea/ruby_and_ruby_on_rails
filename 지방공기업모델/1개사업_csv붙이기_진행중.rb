# 할일: 입력받아야 하는 값을 코드화하자. 현행(p001,p002,p003) 공단(new001,new002,new003)
require 'csv'
# 기본전제
# 5년 증가 기준
$year = 5
$first_year = 2024
# 증가율
$increase_labor = 1.0322
$increase_price = 1.0107
# 사업명
require 'csv' 
path = "C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test_value.csv"
table = CSV.read(path)
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
p table[6][2..]
#공단 인건비
p table[7][2..]
#공단 운영비
p table[8][2..]

# array에서 mean과 sum을 만드는 함수 
def sum(array_num)
    return array_num.instance_eval {reduce(:+) }
end
def mean(array_num)
    return array_num.instance_eval {reduce(:+) } /$year
end 

# 합계 등 출력함수(순서: 구분, 항목, 첫 값)
def complete_array(array_num)
    sum = sum(array_num)
    mean = mean(array_num)
    array_num.push(sum)
    array_num.push(mean)
    return array_num
end
# 증가율 계산 로직(첫 연도 값과 증가율 지정해주면 증가시킴)
def increase(first_year_value, increase_which) 
    Array.new($year) { |n| n = (first_year_value * increase_which ** n).round }
end
# 배열끼리 더하기  
def array_plus(array1, array2)
    new = []
    if array1.length == array2.length
        for i in (0...array1.length)
            new.push(array1[i] + array2[i])
        end
        return new
    else
        puts "They are two different arrays." 
    end
end
# 배열끼리 빼기
def array_minus(array1, array2)
    new = []
    if array1.length == array2.length
        for i in (0...array1.length)
            new.push(array1[i] - array2[i])
        end
        return new
    else
        puts "They are two different arrays." 
    end
end
# 수지비율
def array_suji(array1, array2)
    new = []
    if array1.length == array2.length
        for i in (0...array1.length)
            new.push((100*array1[i].to_f / array2[i]).round(2) )
        end
        return new
    else
        puts "They are two different arrays." 
    end
end
# 첫 해 값 입력 후 비용/수지비율 계산
def make_table(sales_fy, labor_costs_fy, labor_operation_fy)
    cost =  array_plus(increase(labor_costs_fy, $increase_labor), increase(labor_operation_fy, $increase_labor) )
    profit = array_minus(increase(sales_fy, $increase_price) , cost)
    suji = array_suji(increase(sales_fy, $increase_price), cost)
    new_table = [increase(sales_fy, $increase_price),
    # 운영비 더하기 
    cost, 
    increase(labor_costs_fy, $increase_labor) ,
    increase(labor_operation_fy, $increase_labor), profit, suji]
    return new_table
end
# 각 변수의 입력
business_number = table[2].length - 2 

#현행 
total = []
for i in (1..business_number)
    total.push(make_table(table[3][i + 1], table[4][i + 1], table[5][i + 1]) + make_table(table[6][i + 1], table[7][i + 1], table[8][i + 1]))
end


# 최종 쓰기 
CSV.open("C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test6.csv", "w") do |csv|
    csv.to_io.write "\uFEFF"
    for business in total
    csv <<  ["사업명"] 
    csv <<  ["현행방식"] 
    csv <<  ["구분","구분"] + Array.new($year){|n| (n + $first_year).to_s + "년"} + ["계","평균"]
    csv <<  ["영업수익",""] + complete_array(business[0])
    csv <<  ["영업비용","계"]    + complete_array(business[1])
    csv <<  ["","인건비"]   + complete_array(business[2])
    csv <<  ["","운영비"]   + complete_array(business[3])
    csv <<  ["영업이익",""]  + complete_array( business[4])
    csv <<  ["공단방식",""] 
    csv <<  ["영업수익",""] + complete_array( business[6])
    csv <<  ["영업비용","계"] + complete_array( business[7])
    csv <<  ["","인건비"] + complete_array( business[8])
    csv <<  ["","운영비"] + complete_array( business[9])
    csv <<  ["영업이익",""] + complete_array( business[10])
    csv <<  ["경상수지비율",""]  + complete_array( business[11])
    csv <<  ["구분","구분"] + Array.new($year){|n| (n + $first_year).to_s + "년"} + ["계","평균"]
    csv <<  ["현행","영업이익"] + complete_array( business[4][...5])
    csv <<  ["공단","영업이익"] + complete_array( business[10][...5])
    csv <<  ["수지개선효과",""] + complete_array( array_minus(business[10][...5], business[4][...5]  ))
    end
end 
