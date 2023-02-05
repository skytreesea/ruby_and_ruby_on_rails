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