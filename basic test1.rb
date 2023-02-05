

=begin
$	전역 변수
@	인스턴스 변수 이해하기 쉽게 클래스 멤버 변수
=end

# puts 
=begin
puts "Hello world1" #파이썬 print와 비슷, 젤 많이 씀 
print "Hello world3" #줄바꿈 안함
p "Hello world2" #입력한 전체 그냥 출력

# 배열array 생성
new = Array.new(5,3)
cats = ["Navi", "Rudy", "Jumpy123","Chistaller","Happy","Goofy"]
cats2 = cats[1..3]
k=0
p cats2
while k < 3 do 
    k += 1
    #puts cats.pop #pop은 뒤에서부터 꺼냄
    puts cats.shift
end
print cats

# 파이썬과 비슷한 루프
for cat in cats
    puts "The length of #{cat} is #{cat.size}"
end


#범위연산자(1..10)
for i in (1..10)
    print i 
end

# puts 문을 활용하여
for i in (1..10)
    puts i 
end
# for 문을 이용한 각 단어 길이 구하기 
for cat in cats do
    p cat, cat.size
end

# $이 붙느냐 마느냐에 따라 차이 while 반복문
$a = 1
$num = 5
while $a < $num
    puts "I like you #{$a} times"
    $a +=1
end

#until을 이용한 조건문
until $a == 0 
    puts "This number is #$a"
    $a -= 1
end

# for 문으로 구구단 만들기 성공
for number in (2..9) do 
    for number2 in (1..9) do 
        puts " #{number} * #{number2} = #{number*number2}" 
    end
end

# 5년간 증가값 구하기 300, 200, 100 세 값들에 대해서 
first_values = [300,200,100]
increase = 1.0322
years = 5
starting_year = 2022 
k = 0
for first_value in first_values do 
while k < years
    value = first_value * (increase ** k)
    puts value
    k += 1
end
k=0
end


myname = "My name is Kim Changhyun"
puts myname[11..myname.size]
myname[11, myname.size] = "Lee"
puts myname

#Hash = 파이썬의 딕셔너리형과 유사함 

new = {"changhyun" => {"Second Name"=>"Kim", "Name"=>"Changhyun", "age"=>41, "sex"=>"M", "Major"=>"Geography"},
"jeongmin" => {"Second Name"=>"Lee", "Name"=>"Jeongmin", "age"=>23, "sex"=>"F", "Major"=>"Economy"} 
}

keys = new.keys
=begin
for key in 0...keys.length
    print "key      : ", keys[key], "\n"
    print "Name  : ", new[keys[key]]["Name"], "\n"
    print "age  : ", new[keys[key]]["age"], "\n"
    print "sex  : ", new[keys[key]]["sex"], "\n"
    print "Major  : ", new[keys[key]]["Major"], "\n"
    print "\n\n"
  end

for key in 0...keys.length
puts "그의 아이디는 #{keys[key]}이고 이름은 #{new[keys[key]]["Name"]}, #{new[keys[key]]["Major"]} 전공하였고, 나이는 #{new[keys[key]]["age"]}이다.".downcase()
end 



name = "Changhyun Kim"
puts name.include? "Kim"  
puts name[-5..-1]
puts name[0..5]
puts name.index("K")
puts name.upcase()

puts 5.0 / 6
puts "20 % 6 outputs #{20 % 6}"
puts 5 ** 3
num = 20.2332
 
puts num.abs()
puts num.round(2)
puts num.ceil()
puts num.floor()
puts Math.sqrt(625)
puts Math.log(625)
puts Math.sin(0)
puts Math.cos(1)


 
#간단한 계산기 만들기 
puts "Enter your Number:"
num1 = gets.chomp().to_f #chomp()는 뒤에 오는 enter를 무시하게 만듦, to_f는 곧바로 소수로 바꿔줌
puts "anther numbers:"
num2 = gets.chomp().to_f

puts (num1 + num2) # 받은 문자(string)을 소수나 정수(to_i)로 바꿔주는 게 핵심
puts (num1 - num2)
puts (num1 / num2)



friends = Array["Kevin", "Karen","Oscar Wild", "Jack"]

#반복문을 사용한 출력
p friends.reverse()
puts friends.include? "Karen"
puts friends.sort()

#Hash 복습
states = {"New York" => "NY", "California" =>"CA", "Oregon"=>"OR"} 
p states.keys
p states.values
p states["Oregon"]


def say_hi(name, age)
    puts "Hello, #{name} you are #{age} years old."
end

puts "==========top========"
say_hi("Mike",23)
puts "=========bottom========"
say_hi("Jake",81)
=end  

#tk 를 통해 상자 만들기 
require 'tk'
root = TkRoot.new { title "Hello, World!" }
root['geometry'] = '300x200'

TkLabel.new(root) do
  text 'Hello, World!'
  pack { padx 10 ; pady 10; side 'left' }
end



Tk.mainloop