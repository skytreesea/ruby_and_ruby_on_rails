a= [100.0, 98.78, 97.38, 96.05, 94.78]
# array에서 mean과 sum을 만드는 함수 
def sum(array_num)
    return array_num.instance_eval {reduce(:+) }
end
def mean(array_num)
    return array_num.instance_eval {reduce(:+) } / 5
end 
def complete_array(array_num)
    array_num.push(sum(array_num))  
    array_num.push(mean(array_num))
    return array_num
end
 