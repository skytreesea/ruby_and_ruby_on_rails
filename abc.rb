a = {}
a[:name] ="Jack"
a[:age]=23
a[:sex]="male"
#a.text ="He is tall and handsome."

a

c= ["Jack","Chris","Diana"]
e= [1,2,3,4,5]
e.each do |t|
    p t * 3
    p (t.to_f/4)
end