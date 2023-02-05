# encoding: UTF-8
# 할일: showing에 대한 부분 줄임 
# 사업명
name_business = "체육사업1"
# 5년 증가 기준
$year = 5
$first_year = 2024 # 첫 해 
# 증가율
$increase_labor = 1.0322
$increase_price = 1.0107
# 기본전제 소개
puts "#{name_business} 현행방식/공단방식 비교 #{$year}년 기준 인건비 증가율 #{(($increase_labor-1)*100).round(2)}% 물가상승률 #{(($increase_price-1)*100).round(2)}%"

# csv 불러오기 
require 'csv'

table = CSV.parse(File.read("C:/Users/ERC/Documents/김창현 개인/루비/지방공기업모델/test_value.csv"), headers: true)
#사업 1과 2에서 각각 현행/공단 사업수익 등 불러오기 
p business1 = table["사업1"].map{|x| x.to_i}[2..2+$year]
p business2 = table["사업2"].map{|x| x.to_i}[2..2+$year]


# array에서 mean과 sum을 만드는 함수 
def sum(array_num)
    return array_num.instance_eval {reduce(:+) }
end
def mean(array_num)
    return array_num.instance_eval {reduce(:+) } / $year
end 
# 합계 등 출력함수(순서: 구분, 항목, 첫 값)
def show_array(array_num)
    puts "#{array_num} 합 #{sum(array_num)}  평균 #{mean(array_num)}" 
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
        p new
        return new
    else
        puts "They are two different arrays." 
    end
end
#첫 해 값, 현행/공단, 항목 구분입력
def make_line(raw_data)
    new = increase(raw_data[2],raw_data[3]) 
    return new
end

# 각 변수의 입력이 필요한
current_sale = ["현행","영업수입", business1[0], $increase_labor]
current_labor_costs_fy = ["현행","인건비", business1[1], $increase_labor]
current_operation_cost_fy = ["현행","운영비", business1[2], $increase_price]
public_sale = ["공단","영업수입", business1[3], $increase_price]
public_labor_costs_fy= ["공단","인건비", business1[4], $increase_labor]
public_operation_cost_fy= ["공단","운영비", business1[5], $increase_price]

# 영업수입(현행/공단)
make_line(current_sale)
make_line(public_sale)

# 총비용
current_cost = array_plus(make_line(current_labor_costs_fy), make_line(current_operation_cost_fy))
public_cost = array_plus(make_line(public_labor_costs_fy), make_line(public_operation_cost_fy))

#영업이익 계산
current_profit = array_minus(make_line(current_sale), current_cost)
public_profit = array_minus(make_line(public_sale), public_cost)

# 수지개선효과 계산
suji = array_minus(public_profit, current_profit)
puts "수지개선효과 #{$year}년 총 #{sum(suji)}천원" 
puts "수지개선효과 #{$year}년 평균 #{mean(suji)}천원" 

# 공단방식 수지비율 
suji_ratio = array_suji(make_line(public_sale),public_cost)
puts "#{$year}년   평균 #{mean(suji_ratio).round(2)}%" 

 